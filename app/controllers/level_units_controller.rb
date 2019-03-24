# frozen_string_literal: true

class LevelUnitsController < ApplicationController
  def show
    @units = Level.find(params[:level_id]).units
    respond_to do |format|
      format.js
    end
  end
end
