# frozen_string_literal: true

class QuestionManager
  def self.create_multiple_question(user, question_params, correct_answ)
    question = user.multiple_questions.create(question_params)
    assign_correct_answ(question, question_params, correct_answ)
    question
  end

  def self.assign_correct_answ(question, question_params, correct_answ)
    set_all_options_to_false(question)
    correct_answ_content = question_params[:multiple_question_options_attributes][correct_answ][:content]
    question.options.each do |option|
      if option.content == correct_answ_content
        correct_answ = option
      end
    end
    correct_answ.update(correct: true)
  end

  def self.set_all_options_to_false(question)
    question.options.each do |option|
      option.update(correct: false)
    end
  end

  def self.update_multiple_question(question, question_params, correct_answ)
    question.update(question_params)
    assign_correct_answ(question, question_params, correct_answ)
    question
  end
end
