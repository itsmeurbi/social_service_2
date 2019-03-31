# frozen_string_literal: true

class LevelUnitsController < ApplicationController
  def show
    @units = Level.find(params[:level_id]).units
    @questions = Level.find(params[:level_id]).multiple_questions
    respond_to do |format|
      format.js
    end
  end
end
