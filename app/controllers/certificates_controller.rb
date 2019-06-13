class CertificatesController < ApplicationController
  def index
    @templates = CertificatePart.all
    @certificates = Certificate.all
  end

  def new
    @templates = CertificatePart.all
    @certificate = Certificate.new
    @students = Student.select("*").joins(:exam)
  end

  def create
    @certificate = Certificate.create(certificate_params)
    if @certificate.persisted?
      redirect_to certificate_path(@certificate.id)
    end
  end
  

  def edit

  end

  private 

    def certificate_params
      params.require(:certificate).permit(:date, :exam_id, :certificate_parts_id)
    end
end
