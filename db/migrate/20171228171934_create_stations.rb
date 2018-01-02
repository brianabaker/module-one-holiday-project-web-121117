class CreateStations < ActiveRecord::Migration[5.0]

  def change
    create_table :stations do |t|
      t.string :name
      # t.string :address
      # t.boolean :accessible
    end
  end

end
