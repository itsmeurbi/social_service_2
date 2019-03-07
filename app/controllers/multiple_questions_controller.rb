class MultipleQuestionsController < ApplicationController
  def new
    binding.pry
    @question = current_user.multiple_questions.build
  end
end
