# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_questions
#
#  id         :bigint(8)        not null, primary key
#  content    :string(255)
#  value      :integer
#  lecture_id :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint(8)
#

class ComprehensionQuestion < ApplicationRecord
  has_many :comprehension_options, inverse_of: :comprehension_question, dependent: :destroy
  alias_attribute :options, :comprehension_options
  accepts_nested_attributes_for :comprehension_options, reject_if: :all_blank, allow_destroy: true

  has_one_attached :file

  belongs_to :unit
end
