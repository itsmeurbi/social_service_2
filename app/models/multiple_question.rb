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
#

class MultipleQuestion < ApplicationRecord
  has_many :multiple_question_options, inverse_of: :multiple_question, dependent: :destroy
  alias_attribute :options, :multiple_question_options
  accepts_nested_attributes_for :multiple_question_options, reject_if: :all_blank, allow_destroy: true
end
