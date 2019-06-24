# == Schema Information
#
# Table name: exams
#
#  id         :bigint(8)        not null, primary key
#  result     :integer
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level_id   :bigint(8)
#  period_id  :bigint(8)
#  student_id :bigint(8)
#  user_id    :bigint(8)
#

require "test_helper"

describe Exam do
  let(:exam) { Exam.new }

  it "must be valid" do
    value(exam).must_be :valid?
  end
end
