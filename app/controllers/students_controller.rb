# frozen_string_literal: true

class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])

    # link = edit_student_url(params[:id])
    # ApplicationMailer.exam_mail(link, student).deliver
    # flash[:success] = "Se envió el examen con éxito"
    # redirect_to exams_path
  end

  def edit
    @student = Student.find(params[:id])
    @exam = Exam.find_by(student_id: @student.id)
    @level = @exam.level.number
  end

  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def create
    student = Student.create(student_params)
    if student
      redirect_to student_path(student), notice: "Alumno registrado exitosamente"
    else
      render :new, flash: { error: "Algo salió mal" }
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :no_control)
    end
end
