class CreatePreferedMeetingTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :prefered_meeting_times do |t|
      t.string :options
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
