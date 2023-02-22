class AddAccessKeyToRooms < ActiveRecord::Migration[7.0]
  def up
    add_column :rooms, :access_key, :string
    add_index :rooms, :access_key, unique: true

    Room.where(access_key: nil).find_each do |room|
      room.update_column(:access_key, SecureRandom.hex(4))
    end

    change_column :rooms, :access_key, :string, null: false
  end

  def down
    remove_column :rooms, :access_key
  end
end
