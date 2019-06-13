class ExamsController < ApplicationController
  def index
    @exam = Exam.new
    @exams = Exam.all
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
        @exam.exam_quests.new
      end
    end
    if @questions.empty?
      flash[:warning] = "No hay preguntas registradas para el nivel #{@level}"
      redirect_to exams_path
    end
  end

  def create
    @exam = current_user.exams.create(exam_params)
    if @exam.persisted?
      flash[:success] = "Examen creado con éxito"
      redirect_to exams_path
    end
  end

  def show
    @exam = Exam.find(params[:id])
    @level = Level.find(@exam.level_id).number
    @student = Student.find(@exam.student_id)
    @questions = MultipleQuestion.joins(:exam_quests).where("exam_quests.exam_id = ? ", @exam.id )
  end

  def destroy 
    @exam = Exam.find(params[:id])
    @exam.destroy
    flash[:success] = "Se eliminó correctamente el examen"
    redirect_to exams_path
  end

  private

    def exam_params
      params.require(:exam).permit(:date, :grade, :level_id, :user_id, :period_id, :student_id, exam_quests_attributes: [ :multiple_question_id, :exam_id])
    end

    def student_params
      params.require(:student).permit(:no_control, :name, :email)
    end
  
end
