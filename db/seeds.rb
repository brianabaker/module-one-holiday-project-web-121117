require 'rest-client'
require 'json'

train_data = RestClient.get('https://data.cityofnewyork.us/api/views/he7q-3hwy/rows.json?accessType=DOWNLOAD')
train_hash = JSON.parse(train_data)

train_hash["data"].each do |train_array|
  station = train_array[10]
  trainline = train_array[12].split("-")

  new_station = Station.find_or_create_by(name: station)

  trainline.each do |line|
    new_line = Trainline.all.find_by(name: line) || Trainline.create(name: line)
    new_line.stations << new_station

  end


end
