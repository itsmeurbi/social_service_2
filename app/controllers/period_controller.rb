# frozen_string_literal: true

class PeriodController < ApplicationController
  def new
    @period = Period.new
  end

  def index
    @actual_period = Period.actual_period
  end

  def create
    if Period.create(period_params).persisted?
      redirect_to period_index_path, notice: "Se actualizó correctamente"
    else
      redirect_back fallback_location: { action: "new", alert: question.errors.full_messages.join(" ") }
    end
  end

  private
    def period_params
      params.require(:period).permit(:starts_at, :ends_at)
    end
end
