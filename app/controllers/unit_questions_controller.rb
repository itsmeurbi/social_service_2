# frozen_string_literal: true

class UnitQuestionsController < ApplicationController
  def show
    @questions = Unit.find(params[:unit_id]).multiple_questions
    respond_to do |format|
      format.js
    end
  end
end
