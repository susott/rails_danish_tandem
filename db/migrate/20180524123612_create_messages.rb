class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :read
      t.references :sender, index: true
      t.references :receiver, index: true

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :receiver_id
    add_foreign_key :messages, :users, column: :sender_id
  end
end
