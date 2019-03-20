class CreateMultipleQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_question_options do |t|
      t.string :content
      t.integer :type
      t.boolean :correct, default: false
      t.references :multiple_question, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
