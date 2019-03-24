# frozen_string_literal: true

class LevelController < ApplicationController
  def new
    @level = Level.new
    @editorials = Editorial.all
  end

  def show
    @level = Level.find(params[:id])
  end

  def index
    @editorials = Editorial.all
    @actual_editorial = Period.actual_period[0].editorial_id
  end

  def create
    level = Level.create(level_params)
    if level.persisted?
      redirect_to level_index_path, notice: "Se actualizó correctamente"
    else
      redirect_back fallback_location: { action: "new", alert: level.errors.full_messages.join(" ") }
    end
  end

  private
    def level_params
      params.require(:level).permit(:number, :editorial_id)
    end
end
