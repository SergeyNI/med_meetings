class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.datetime :meeting_time
      t.string :user_complaint
      t.string :doctor_recomendations

      t.timestamps
    end
  end
end
