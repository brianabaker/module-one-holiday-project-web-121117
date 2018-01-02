
require 'pry'
require 'colorize'
require 'artii'

class CommandLineInterface

  def greet
    puts "Welcome to TrainFinder, the command line solution to for your MTA train-finding needs!".colorize(:red)
    puts "We can help you find which train lines are available at NYC subway stations.".colorize(:red)
    puts "How it works:".colorize(:blue)
    puts "1. Type single word related to the station.".colorize(:blue)
    puts "2. It will return a full list of stations including that word.".colorize(:blue)
    puts "3. Type full name as listed for the station you wish to see.".colorize(:blue)
    puts "4. It will show you what lines are available at the station!".colorize(:blue)
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Trainlines!')
  end

  def gets_user_input
    gets.chomp
  end

#take in a string of a name
#see if the words in that string that are not st, nw, at, etc are in one of the name strings
#return the full name strings, numbered, that it matches
# ignore = ["sw", "nw", "se", "ne", "blvd", "st", "corner", "ave", "rd", "&"]
# def find_station(input)
#   downcase = input.downcase!
#   Station.where(
#     Station.arel_table[:name]
#       .lower
#       .matches("%#{downcase}%")
#   )
#   # split_string = downcase.split
#   # station_name = station.name.downcase!
#   # split_station_name = station_name.split
#   # same_words = split_string.select {|word| word == split_station_name}

  def related_stations(input)
    partial_name = input
    results= Station.where("name like ?", "%#{partial_name}%")
    results_arr = results.map {|instance| instance.name }
    results_arr.each {|item| puts item }
    puts "Please enter full Station name to see its Trainlines:".colorize(:blue)
  end

# results= Station.where("name like ?", "%#{morris}%")

  def find_station(name)
    result = Station.find_by(name: name)
    if result
      result
    else
      puts "Please try again! Must be valid full name!".colorize(:blue)
      puts "Type 'help' if you need assistance!".colorize(:blue)
      run
    end
  end

  def find_lines(station)
    train_arr = station.trainlines.map {|x| x.name }
    puts "This station has the following trains:".colorize(:blue)
    puts "#{train_arr.uniq.join(", ")}"
  end

  def exit
    puts "Goodbye!".colorize(:blue)
  end

  def help
    puts "Beta Metro App, find out what lines are available at any Subway Stop!".colorize(:light_red)
    puts "Step ONE".colorize(:red)
    puts "Type a partial Subway Station name to begin. MUST BE ONE WORD.".colorize(:light_red)
    puts "Step TWO".colorize(:red)
    puts "Input full name as shown to see lines available.".colorize(:light_red)
    puts "Type 'exit' to exit the program.".colorize(:light_red)
  end

  def run
    greet
    puts "Type 'help' for further assistance.".colorize(:blue)
    puts "Type 'exit' to leave the program.".colorize(:blue)
    loop do
      puts "To Begin:".colorize(:green)
      puts "Enter SINGLE WORD partial name of Subway Station to see related Stations".colorize(:green)
      response = gets.chomp
      if response  == 'help'
        help
      elsif response == 'exit'
        exit
        break
      else
        related_stations(response)
        full_station = gets.chomp
        station= find_station(full_station)
        find_lines(station)
      end

    end
  end

end
