class AddFirstNameAndSecondNameAndPhoneNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :phone_number, :string
  end
end
