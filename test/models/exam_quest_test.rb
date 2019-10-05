# frozen_string_literal: true

require "test_helper"

describe ExamQuest do
  let(:exam_quest) { ExamQuest.new }

  it "must be valid" do
    value(exam_quest).must_be :valid?
  end
end
