# frozen_string_literal: true

class StudentsController < ApplicationController
  def show
    student = Student.find(params[:id])
    link = edit_student_url(params[:id])
    ApplicationMailer.exam_mail(link, student).deliver
    flash[:success] = "Se envió el examen con éxito"
    redirect_to exams_path
  end

  def edit
    @student = Student.find(params[:id])
    @exam = Exam.find_by(student_id: @student.id)
    @level = @exam.level.number
  end

  def new
    questions_qty = params[:"questions-qty"].to_i
    total = 0
    questions_qty.times do |q|
      correct = params[:"#{q}-correct_answ"]
      correct = params[:"#{q}-#{correct}"] == "true"
      total += params[:"#{q}-value"].to_i if correct
    end
    @e = Exam.find(params[:"exam"])
    @e.result = total
    @e.save
  end
end
