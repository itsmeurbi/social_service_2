# frozen_string_literal: true

class MultipleQuestionsController < ApplicationController
  def new
    @unit = determine_unit
    @question = current_user.multiple_questions.build
    3.times { @question.multiple_question_options.new }
    @comprehension_question = params[:comprehension_question]
  end

  def edit
    question
  end

  def show
    question
  end

  def index
    @question = MultipleQuestion.new
    @questions = MultipleQuestion.all
    @editorials = Editorial.all
    @actual_editorial = Period.actual_period[0]&.editorial || Editorial.last
  end

  def create
    @question = QuestionManager.create_multiple_question(current_user, question_params, params[:correct_answ])
    if @question.persisted?
      redirect_to multiple_questions_path
    end
  end

  def update
    if QuestionManager.update_multiple_question(question, question_params, params[:correct_answ])
      flash[:success] = "Se actualizó correctamente"
      redirect_to multiple_questions_path
    else
      redirect_back fallback_location: { action: "new", alert: question.errors.full_messages.join(" ") }
    end
  end

  def destroy
    begin
      question.destroy
      flash[:success] = "Se eliminó la pregunta con éxito"
      redirect_to multiple_questions_path
    rescue StandardError => e
      flash[:warning] = e
      redirect_back fallback_location: { action: "new", notice: question.errors.full_messages.join(" ") }
    end
  end

  private

    def question_params
      binding.pry
      params.require(:multiple_question).permit(:content, :value, :unit_id, :comprehension_question_id, multiple_question_options_attributes: [:id, :content, :correct, :_destroy])
    end

    def question
      @question ||= current_user.multiple_questions.find(params[:id])
    end

    def determine_unit
      if params[:unit]
        params[:unit][:unit_id]
      elsif params[:multiple_question]
        params[:multiple_question][:unit]
      end
    end
end
