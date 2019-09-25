# frozen_string_literal: true

class SendExamController < ApplicationController
  def show
    exam = Exam.find(params[:id])
    student = exam.student
    link = new_exam_quest_url(exam_id: params[:id])
    ApplicationMailer.exam_mail(link, student).deliver
    flash[:success] = 'Se envió el examen con éxito'
    redirect_to exam_path(exam)
  end
end
