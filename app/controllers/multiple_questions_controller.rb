class MultipleQuestionsController < ApplicationController
  def new
    @question = current_user.multiple_questions.build
    3.times { @question.multiple_question_options.new }
  end

  def create
    @question = current_user.multiple_questions.create(question_params)
    if @question.persisted?
      binding.pry
      redirect_to authenticated_root_path
    end
  end

  private

    def question_params
      params.require(:multiple_question).permit(:content, :value, options_attributes: [:id, :content, :_destroy])
    end
end
