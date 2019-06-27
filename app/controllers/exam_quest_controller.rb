# frozen_string_literal: true

class ExamQuestController < ApplicationController
  def new
    @exam = Exam.find(params[:exam_id])
  end

  def create
    @exam = Exam.find(params[:exam][:exam_id])
    params_array = construct_params
    params_array.each do |params|
      ExamQuest.where(exam_id: @exam.id, multiple_question_id: params[:multiple_question_id]).
      update(
        chosed_answ: params[:chosed_answ],
        status: params[:status]
      )
    end
    @exam.update(result: result)
    redirect_to exam_quest_path(@exam)
  end

  def show
    @exam = Exam.find(params[:id])
  end

  private
   def construct_params
    multiple_questions = []
    comprehension_questions = []
    params.each do |param|
      multiple_questions << param if param[0].match(/mq-[0-9]+/)
      comprehension_questions << param if param[0].match(/cq-[0-9]+/)
    end
    params_array = []
    multiple_questions.each do |pair|
      params_array << {
                        multiple_question_id: pair[0].gsub('mq-', '').to_i,
                        chosed_answ: pair[1],
                        exam_id: @exam.id,
                        status: MultipleQuestionOption.find(pair[1]).status
                      }
    end

    comprehension_questions.each do |pair|
      question_id = pair[0].gsub('cq-', '').to_i
      comprehension_question_id = MultipleQuestion.find(question_id).comprehension_question.id
      params_array << {
                        multiple_question_id: question_id,
                        chosed_answ: pair[1],
                        exam_id: @exam.id,
                        status: MultipleQuestionOption.find(pair[1]).status,
                        comprehension_question_id: comprehension_question_id
                      }
    end
    params_array
   end

   def result
    value = 0
    @exam.exam_quests.each do |q|
      value += MultipleQuestion.find(q.multiple_question_id).value if q.status == 1
    end
    value
   end
end
