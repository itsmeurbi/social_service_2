# frozen_string_literal: true

class UnitQuestionsController < ApplicationController
  def show
    if params[:unit_id].present? && params[:compreh_quest].present?
      @comprehension_questions = true
      @questions = Unit.find(params[:unit_id]).comprehension_questions
    elsif params[:unit_id].present?
      @questions = Unit.find(params[:unit_id]).multiple_questions
    elsif params[:compreh_quest].present?
      @comprehension_questions = true
      @questions = ComprehensionQuestion.all.where(level: level)
    else
      @questions = MultipleQuestion.all_non_comprehension.where(level: level)
    end

    respond_to do |format|
      format.js
    end
  end
end
