# frozen_string_literal: true

# == Schema Information
#
# Table name: multiple_questions
#
#  id                        :bigint           not null, primary key
#  content                   :string(255)
#  value                     :integer
#  user_id                   :bigint
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  unit_id                   :bigint
#  comprehension_question_id :bigint
#

class MultipleQuestion < ApplicationRecord
  has_many :multiple_question_options, inverse_of: :multiple_question, dependent: :destroy
  alias_attribute :options, :multiple_question_options
  accepts_nested_attributes_for :multiple_question_options, reject_if: :all_blank, allow_destroy: true

  belongs_to :unit, optional: true
  belongs_to :comprehension_question, optional: true
  has_one :editorial, through: :unit
  has_one :level, through: :unit
  has_many :exam_quests
  has_many :exams, through: :exam_quests

  scope :all_non_comprehension, -> { where(comprehension_question_id: nil) }
  scope :per_unit, -> { group_by(&:unit_id) }
end
