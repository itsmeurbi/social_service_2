# frozen_string_literal: true

class ExamUnitQuestionsController < ApplicationController
  def show
    @units = Unit.where(level_id: params[:level_id])
  end
end
