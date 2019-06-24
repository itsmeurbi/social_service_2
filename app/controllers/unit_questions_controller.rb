# frozen_string_literal: true

class UnitQuestionsController < ApplicationController
  def show
    if params[:unit_id].present?
      @questions = Unit.find(params[:unit_id]).multiple_questions
    else
      level = params[:level_id]
      @questions = MultipleQuestion.all_non_comprehension.where(level: level)
    end
    respond_to do |format|
      format.js
    end
  end
end
