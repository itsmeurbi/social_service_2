# frozen_string_literal: true

class CertificatesController < ApplicationController
  
  def index
    @certificates = Certificate.all
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to certificate_path(@certificate.id)
    else 
      render 'new', notice: @certificate.errors.full_messages.join(',')
    end
  end

  def edit
  end

  def show
    @certificate = Certificate.find(params[:id])
    @template = CertificatePart.find(@certificate.certificate_parts_id)
    @exam = Exam.find(@certificate.exam_id)
    @student = Student.find(@exam.student_id)
    @employees = @certificate.employees

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "English certificate: #{@student.name}",
        page_size: "A4",
        template: "certificates/_certificate.html.erb",
        layout: "pdf.html.erb",
        encoding: "UTF-8",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    flash[:success] = "Certificado eliminado con éxito"
    redirect_to certificates_path
  end

  private

    def certificate_params
      params.require(:certificate).permit(:date, :exam_id, :certificate_parts_id, employee_ids: [])
    end
end
