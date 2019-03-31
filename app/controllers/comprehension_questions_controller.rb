# frozen_string_literal: true

class ComprehensionQuestionsController < ApplicationController
  def new
    @unit = determine_unit
    @question = current_user.comprehension_questions.build
    3.times { @question.comprehension_options.new }
  end

  def index
    @question = ComprehensionQuestion.new
    @questions = ComprehensionQuestion.all
    @editorials = Editorial.all
    @actual_editorial = Period.actual_period[0]&.editorial || Editorial.last
  end

  def create
    @question = QuestionManager.create_comprehension_question(current_user, question_params, params[:correct_answ])
    if @question.persisted?
      redirect_to comprehension_questions_path
    end
  end

  private
    def question_params
      params.require(:comprehension_question).permit(:content, :value, :unit_id, comprehension_options_attributes: [:id, :content, :correct, :_destroy])
    end

    def question
      @question ||= current_user.comprehension_questions.find(params[:id])
    end

    def determine_unit
      if params[:unit]
        params[:unit][:unit_id]
      elsif params[:comprehension_question]
        params[:comprehension_question][:unit_id]
      end
    end
end
