class ChangeAddressInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :address, :city
    add_column :users, :street, :string
  end
end
