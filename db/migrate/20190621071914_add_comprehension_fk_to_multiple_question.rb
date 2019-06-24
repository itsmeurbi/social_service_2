class AddComprehensionFkToMultipleQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :multiple_questions, :comprehension_question, foreign_key: {on_delete: :cascade}
  end
end
