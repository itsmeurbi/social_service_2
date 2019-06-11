# frozen_string_literal: true

# == Schema Information
#
# Table name: multiple_questions
#
#  id         :bigint(8)        not null, primary key
#  content    :string(255)
#  value      :integer
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint(8)
#

class MultipleQuestion < ApplicationRecord
  has_many :multiple_question_options, inverse_of: :multiple_question, dependent: :destroy
  alias_attribute :options, :multiple_question_options
  accepts_nested_attributes_for :multiple_question_options, reject_if: :all_blank, allow_destroy: true

  belongs_to :unit

  has_many :exam_quests
  has_many :exams, through: :exam_quests
  
  # def editorial_questions(levels)
  #   questions = []
  #   levels.each do |level|
  #     questions << unit.multiple_questions
  #   end
  # end
end
