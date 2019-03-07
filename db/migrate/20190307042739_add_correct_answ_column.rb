class AddCorrectAnswColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :comprehension_questions, :correct_answ, foreign_key: { to_table: :comprehension_options }
    add_reference :multiple_questions, :correct_answ, foreign_key: { to_table: :multiple_question_options }
  end
end
