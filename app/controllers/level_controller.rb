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
    @actual_editorial = Editorial.find(Period.actual_period&.editorial_id)
    if @actual_editorial
      @editorials = Editorial.all.reject do |e|
        e.id == @actual_editorial.id
      end
    end
  end

  def create
    level = Level.create(level_params)
    if level.persisted?
      redirect_to level_index_path, notice: 'Se actualizó correctamente'
    else
      redirect_back fallback_location: { action: 'new', alert: level.errors.full_messages.join(' ') }
    end
  end

  private

  def level_params
    params.require(:level).permit(:number, :editorial_id)
  end
end
