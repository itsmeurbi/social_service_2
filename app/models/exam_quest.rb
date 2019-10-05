# frozen_string_literal: true

class ExamQuest < ApplicationRecord
  belongs_to :exam
  belongs_to :multiple_question
end
