# frozen_string_literal: true

# == Schema Information
#
# Table name: multiple_question_options
#
#  id                   :bigint(8)        not null, primary key
#  content              :string(255)
#  type                 :integer
#  correct              :boolean          default(FALSE)
#  multiple_question_id :bigint(8)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class MultipleQuestionOption < ApplicationRecord
  belongs_to :multiple_question, optional: true

  def status
    correct ? 1 : 0
  end

  scope :question_options, -> (question) { where(multiple_question_id: question.id)}
end
