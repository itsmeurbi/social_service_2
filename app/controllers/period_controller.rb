# frozen_string_literal: true

class PeriodController < ApplicationController
  def new
    @period = Period.new
    @editorials = Editorial.all
  end

  def index
    @actual_period = Period.actual_period
  end

  def create
    period = Period.create(period_params)
    if period.persisted?
      redirect_to period_index_path, notice: "Se actualizó correctamente"
    else
      redirect_back fallback_location: { action: "new", alert: period.errors.full_messages.join(" ") }
    end
  end

  private
    def period_params
      params.require(:period).permit(:starts_at, :ends_at, :editorial_id)
    end
end
