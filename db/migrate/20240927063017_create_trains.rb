class CreateTrains < ActiveRecord::Migration[7.1]
  def change
    create_table :trains do |t|
      t.string :name
      t.integer :number
      t.time :departure_time
      t.time :arrival_time
      t.integer :direction_id

      t.timestamps
    end
  end
end
