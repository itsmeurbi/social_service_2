# frozen_string_literal: true

# == Schema Information
#
# Table name: exams
#
#  id         :bigint(8)        not null, primary key
#  result     :integer
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level_id   :bigint(8)
#  period_id  :bigint(8)
#  student_id :bigint(8)
#  user_id    :bigint(8)
#

class Exam < ApplicationRecord
  belongs_to :level
  belongs_to :student
  belongs_to :period
  belongs_to :user

  has_many :exam_quests, dependent: :destroy
  has_many :multiple_questions, through: :exam_quests
  has_many :comprehension_questions, through: :exam_quests
  accepts_nested_attributes_for :exam_quests

  scope :approved, -> { select("exams.id, students.name").joins(:student).where("exams.result >= 50").as_json }
end
