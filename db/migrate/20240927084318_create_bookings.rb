class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :gender
      t.integer :seat_no
      t.references :bookable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
