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

require "test_helper"

describe MultipleQuestion do
  let(:multiple_question) { MultipleQuestion.new }

  it "must be valid" do
    value(multiple_question).must_be :valid?
  end
end