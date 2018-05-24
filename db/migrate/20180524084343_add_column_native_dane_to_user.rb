class AddColumnNativeDaneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :native_dane, :boolean, :default => false
  end
end
