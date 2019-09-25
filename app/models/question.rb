# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  enum type: {
    multiple_question: 0,
    comprehension_question: 1
  }

  belongs_to :multiple_question
end
