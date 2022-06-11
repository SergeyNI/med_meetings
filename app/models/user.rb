class User < ApplicationRecord
  has_many :meetings
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates "first_name",  presence: true, on: :update
  validates "second_name", presence: true, on: :update
  validates "phone_number", presence: true, on: :update
  def view
    "#{first_name} #{second_name}"
  end
end
