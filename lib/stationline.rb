
class Stationline < ActiveRecord::Base
  belongs_to :station
  belongs_to :trainline
end
