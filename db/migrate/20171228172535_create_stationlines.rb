class CreateStationlines < ActiveRecord::Migration[5.0]

  def change
    create_table :stationlines do |t|
      t.references :station
      t.references :trainline
    end
  end

end
