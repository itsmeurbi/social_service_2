class StudentsController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @student = Student.find(params[:id])
    @exam = Exam.find_by(student_id: @student.id)
    @questions = MultipleQuestion.joins(:exam_quests).where("exam_quests.exam_id = ? ", @exam.id)
  end
end
