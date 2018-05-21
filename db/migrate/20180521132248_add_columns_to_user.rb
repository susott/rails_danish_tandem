class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :dedication, :string
    add_column :users, :from_country, :string
    add_column :users, :gender, :string
    add_column :users, :photo, :string
  end
end
