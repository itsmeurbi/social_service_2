class ExamsController < ApplicationController
  before_action :validate_user_data, only: :new
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
    @exam.build_student(student_params)
    @units = Unit.where(level_id: @level)
    @questions = Array.new
    @units.each do |unit|
      unit_questions = MultipleQuestion.includes(:multiple_question_options).order("RAND()").where(unit_id: unit).limit(params["questions-unit"].to_i)
      unit_questions.each do |q|
        @questions.push(q)
      end
    end
    @questions.each do |question|
      @exam.exam_quests.build(multiple_question_id: question.id)
    end
    if @exam.exam_quests.empty?
      flash[:warning] = "No hay preguntas registradas para el nivel #{@level}"
      redirect_to exams_path
    end
  end

  def create
    @exam = current_user.exams.new(exam_params)
    if @exam.save
      flash[:success] = "Examen creado con éxito"
      redirect_to exams_path
    else
      render :new, danger: @exam.errors.full_messages
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

  def validate_user_data
    if student_params[:no_control].empty? || student_params[:name].empty? || student_params[:email].empty?
      flash[:danger] = "Debes de ingresar todos los datos del estudiante"
      return redirect_to exams_path
    end
  end

    def exam_params
      params.require(:exam).permit(
        :date, 
        :grade,
         :level_id, 
         :user_id, 
         :period_id, 
         :student_id,
         student_attributes: [:id, :name, :no_control, :email],
          exam_quests_attributes: [ :multiple_question_id, :exam_id])
    end

    def student_params
      params.require(:exam).require(:student).permit(:no_control, :name, :email)
    end

end
