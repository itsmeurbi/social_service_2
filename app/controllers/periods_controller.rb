# frozen_string_literal: true

class PeriodsController < ApplicationController
  before_action :actual_period, only: %i[index edit]
  def new
    @period = Period.new
    @editorials = Editorial.all
  end

  def edit
    @editorials = Editorial.all
  end

  def index
    @actual_period = Period.actual_period
  end

  def create
    period = Period.create(period_params)
    if period.persisted?
      redirect_to periods_path, notice: 'Se actualizó correctamente'
    else
      redirect_back fallback_location: { action: 'new', alert: period.errors.full_messages.join(' ') }
    end
  end

  private

  def period_params
    params.require(:period).permit(:starts_at, :ends_at, :editorial_id)
  end

  def actual_period
    @period ||= Period.actual_period
  end
end
