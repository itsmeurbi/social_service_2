class Exam < ApplicationRecord
  belongs_to :level
  belongs_to :student
  belongs_to :period
  belongs_to :user

  has_many :exam_quests, dependent: :destroy
  has_many :multiple_question, through: :exam_quests
  accepts_nested_attributes_for :exam_quests
end
