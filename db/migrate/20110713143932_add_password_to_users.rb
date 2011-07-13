class AddPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :encryption_password, :string
  end

  def self.down
    remove_column :users, :encryption_password
  end
end
