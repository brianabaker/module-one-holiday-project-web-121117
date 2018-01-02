class CreateTrainlines < ActiveRecord::Migration[5.0]

  def change
    create_table :trainlines do |t|
      t.string :name
      # t.string :known_as
      # t.string :color
      # t.datetime :started_service
    end
  end

end
