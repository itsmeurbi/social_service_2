class Exam < ApplicationRecord
  belongs_to :level
  belongs_to :student
  belongs_to :period
  belongs_to :user

end
