class Student < ApplicationRecord
  has_one :exam

  validates :no_control, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
