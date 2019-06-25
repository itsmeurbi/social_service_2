# frozen_string_literal: true

class CertificateTemplatesController < ApplicationController
  def new
    @template = CertificatePart.new
  end

  def create
    @template = CertificatePart.create(certificate_parts_params)
    if @template.persisted?
      flash[:success] = "Plantilla creada con éxito"
      redirect_to certificates_path
    end
  end

  def show
    @template = CertificatePart.find(params[:id])
  end

  def edit
    @template = CertificatePart.find(params[:id])
  end

  def destroy
    @template = CertificatePart.find(params[:id])
    @template.destroy
    flash[:success] = "Se eliminó correctamente la plantilla"
    redirect_to certificates_path
  end
  private

    def certificate_parts_params
      params.require(:certificate_part).permit(:header, :body, :footer, :name)
    end
end
