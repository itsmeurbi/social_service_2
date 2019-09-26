# frozen_string_literal: true

class EditorialController < ApplicationController
  def new
    @editorial = Editorial.new
  end

  def index
    @editorials = Editorial.all
  end

  def create
    editorial = Editorial.create(editorial_params)
    if editorial.persisted?
      redirect_to editorial_index_path, notice: 'Se actualizó correctamente'
    else
      redirect_back fallback_location: { action: 'new', alert: editorial.errors.full_messages.join(' ') }
    end
  end

  private

  def editorial_params
    params.require(:editorial).permit(:editorial_id, :name)
  end
end
