class ExamsController < ApplicationController
  def index
    @exam = Exam.new
    @student = Student.new
    @actual_period = Period.actual_period
    @actual_editorial = Period.actual_period[0]&.editorial || Editorial.last
  end

  def new
    @exam = current_user.exams.build
    @level = params[:exam][:level_id]
    @actual_period = Period.actual_period.last.id
    @student = Student.create(name: params[:exam][:student][:name], no_control: params[:exam][:student][:no_control], email: params[:exam][:student][:email]) #No le puse strong params porque no supe como ponerlos en requiere si viene dentro de exam :(
    @units = Unit.where(level_id: @level)
    @questions = Array.new
    @units.each do |unit|
      unit_questions = MultipleQuestion.where(unit_id: unit)
      unit_questions.each do |q|
        @questions.push(q)
      end
    end
  end

  def create
    @exam = current_user.exams.create(exam_params)
    if @exam.persisted?
      redirect_to exams_path
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:date, :grade, :level_id, :user_id, :period_id, :student_id)
  end

  def student_params
    params.require(:student).permit(:no_control, :name, :email)
  end
  
end
