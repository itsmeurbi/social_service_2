class ExamQuest < ApplicationRecord
  belongs_to :exam
  belongs_to :multiple_question
end
