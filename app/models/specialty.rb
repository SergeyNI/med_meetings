class Specialty < ApplicationRecord
  has_many :doctors, dependent: :destroy
  validates :name,  uniqueness: true
  scope :for_show, -> { where.not(:name => "not_assigned")}
  # Ex:- scope :active, -> {where(:active => true)}
end
