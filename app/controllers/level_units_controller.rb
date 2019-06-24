# frozen_string_literal: true

class LevelUnitsController < ApplicationController
  def show
    if params[:level_id].present?
      @units = Level.find(params[:level_id]).units
      @questions = Level.find(params[:level_id]).multiple_questions
    else
      ed = params[:editorial_id]
      @questions = MultipleQuestion.all_non_comprehension.where(editorial: ed)
    end
    respond_to do |format|
      format.js
    end
  end
end
