class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :number
      t.time :departure_time
      t.time :arrival_time
      t.integer :directions_id

      t.timestamps
    end
  end
end
