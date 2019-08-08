# frozen_string_literal: true

module MultipleQuestionsHelper
  def options(q)
    MultipleQuestionOption.question_options(q)
  end
end
