
class Station < ActiveRecord::Base
  has_many :stationlines
  has_many :trainlines, through: :stationlines

end
