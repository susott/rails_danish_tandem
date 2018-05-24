class AddPhotoBackgroundToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo_background, :string
  end
end
