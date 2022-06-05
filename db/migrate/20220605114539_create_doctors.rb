class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :second_name
      t.references :specialty, foreign_key: true
      t.string :phone_number

      t.timestamps
    end
  end
end
