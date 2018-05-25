class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    remove_column :users, :city
    remove_column :users, :street
  end
end
