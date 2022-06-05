class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :specialty
  validates "first_name",  presence: true
  validates "second_name", presence: true
  validates "phone_number", presence: true
end
