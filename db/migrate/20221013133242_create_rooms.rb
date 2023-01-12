class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.text :body
      t.integer :price
      t.string :address
      t.string :image_id

      t.timestamps
    end
  end
end
