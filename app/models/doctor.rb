class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :specialty
  has_many :meetings
  validates "first_name",  presence: true, on: :update
  validates "second_name", presence: true, on: :update
  validates "phone_number", presence: true
  validates "specialty_id", presence: false
  def view
    "#{first_name} #{second_name}"
  end
end
