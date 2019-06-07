# frozen_string_literal: true

class UnitController < ApplicationController
  def new
    @level = params[:level]
    @unit = Unit.new
  end

  def create
    unit = Unit.create(unit_params)
    if unit.persisted?
      redirect_to level_index_path, notice: "Se actualizó correctamente"
    else
      redirect_back fallback_location: { action: "new", alert: unit.errors.full_messages.join(" ") }
    end
  end

  private
    def unit_params
      params.require(:unit).permit(:number, :name, :level_id)
    end
end
