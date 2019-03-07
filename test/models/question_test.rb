# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint(8)
#

require "test_helper"

describe Question do
  let(:question) { Question.new }

  it "must be valid" do
    value(question).must_be :valid?
  end
end
