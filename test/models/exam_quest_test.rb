# frozen_string_literal: true

# == Schema Information
#
# Table name: exam_quests
#
#  id                        :bigint(8)        not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  status                    :integer
#  chosed_answ               :integer
#  multiple_question_id      :bigint(8)
#  exam_id                   :bigint(8)
#  comprehension_question_id :bigint(8)
#

require "test_helper"

describe ExamQuest do
  let(:exam_quest) { ExamQuest.new }

  it "must be valid" do
    value(exam_quest).must_be :valid?
  end
end
