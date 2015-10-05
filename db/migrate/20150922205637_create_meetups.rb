class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :location_id
      t.integer :user_id, null: false
      t.time :datetime, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
