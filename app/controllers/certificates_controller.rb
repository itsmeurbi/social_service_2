class CertificatesController < ApplicationController
  def index
    @templates = CertificatePart.all
    @certificates = Certificate.all
  end

  def new
    @templates = CertificatePart.all
    @certificate = Certificate.new
    @exams = Exam.select("*").joins(:student).as_json
  end

  def create
    @certificate = Certificate.create(certificate_params)
    if @certificate.persisted?
      redirect_to certificate_path(@certificate.id)
    end
  end
  
  def edit

  end

  def show 
    @certificate = Certificate.find(params[:id])
    @template = CertificatePart.find(@certificate.certificate_parts_id)
    @exam = Exam.find(@certificate.exam_id)
    @student = Student.find(@exam.student_id)
  end

  def destroy 
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    flash[:success] = "Certificado eliminado con éxito"
    redirect_to certificates_path
  end

  private 

    def certificate_params
      params.require(:certificate).permit(:date, :exam_id, :certificate_parts_id)
    end
end
