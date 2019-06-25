# frozen_string_literal: true

class LevelUnitsController < ApplicationController
  def show
    ed = params[:editorial_id]
    if params[:level_id].present? && params[:compreh_quest].present?
      @comprehension_questions = true
      @units = Level.find(params[:level_id]).units
      @questions = Level.find(params[:level_id]).comprehension_questions
    elsif params[:level_id].present?
      @units = Level.find(params[:level_id]).units
      @questions = Level.find(params[:level_id]).multiple_questions
    elsif params[:compreh_quest].present?
      @comprehension_questions = true
      @questions = ComprehensionQuestion.all.where(editorial: ed)
    else
      @questions = MultipleQuestion.all_non_comprehension.where(editorial: ed)
    end

    respond_to do |format|
      format.js
    end
  end
end
