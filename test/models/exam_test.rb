require "test_helper"

describe Exam do
  let(:exam) { Exam.new }

  it "must be valid" do
    value(exam).must_be :valid?
  end
end
