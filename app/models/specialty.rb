class Specialty < ApplicationRecord
  has_many :doctors, dependent: :destroy
  validates :name,  uniqueness: true
end
