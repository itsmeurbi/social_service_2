# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_questions
#
#  id         :bigint(8)        not null, primary key
#  content    :string(255)
#  value      :integer
#  lecture_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe ComprehensionQuestion do
  let(:comprehension_question) { ComprehensionQuestion.new }

  it "must be valid" do
    value(comprehension_question).must_be :valid?
  end
end
