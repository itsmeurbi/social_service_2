class AddComprehensionFkToMultipleQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :multiple_questions, :comprehension_question, foreign_key: true
  end
end
