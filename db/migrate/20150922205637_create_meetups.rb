class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.datetime :datetime, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
