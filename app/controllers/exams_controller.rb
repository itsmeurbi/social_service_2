class ExamsController < ApplicationController
  def index
    @exam = Exam.new
    @actual_period = Period.actual_period
    @editorials = Editorial.all
    @actual_editorial = Period.actual_period[0]&.editorial || Editorial.last
  end

  def new
    
  end

  def create
  end

  private

  def exam_params
    params.requiere(:exam).permit()
  end
  
end
