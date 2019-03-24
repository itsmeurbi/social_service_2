# frozen_string_literal: true

class MultipleQuestionsController < ApplicationController
  def new
    @question = current_user.multiple_questions.build
    3.times { @question.multiple_question_options.new }
  end

  def edit
    question
  end

  def show
    question
  end

  def index
    @questions = MultipleQuestion.all
  end

  def create
    @question = QuestionManager.create_multiple_question(current_user, question_params, params[:correct_answ])
    if @question.persisted?
      redirect_to multiple_questions_path
    end
  end

  def update
    if QuestionManager.update_multiple_question(question, question_params, params[:correct_answ])
      redirect_to multiple_questions_path, notice: "Se actualizó correctamente"
    else
      redirect_back fallback_location: { action: "new", alert: question.errors.full_messages.join(" ") }
    end
  end

  def destroy
    question.destroy
    redirect_to multiple_questions_path, notice: "Se eliminó la pregunta con éxito"
  end

  private

    def question_params
      params.require(:multiple_question).permit(:content, :value, multiple_question_options_attributes: [:id, :content, :correct, :_destroy])
    end

    def question
      @question ||= current_user.multiple_questions.find(params[:id])
    end
end