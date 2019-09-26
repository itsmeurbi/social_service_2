# frozen_string_literal: true

class EditorialLevelsController < ApplicationController
  def show
    if params[:editorial_id].present? && params[:compreh_quest].present?
      manage_comprehension_question_request
    elsif params[:editorial_id].present?
      manage_multiple_question_request
    elsif params[:compreh_quest].present?
      @comprehension_questions = true
      @questions = ComprehensionQuestion.all
    else
      @questions = MultipleQuestion.all_non_comprehension
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def manage_comprehension_question_request
    levels_units
    @comprehension_questions = true
    @questions = Editorial.find(params[:editorial_id]).comprehension_questions
  end

  def manage_multiple_question_request
    levels_units
    @questions = Editorial.find(params[:editorial_id]).multiple_questions
  end

  def levels_units
    @levels = Level.available_levels_by_editorial(params[:editorial_id])
    @units = @levels.first&.units ? @levels.first.units : []
  end
end
