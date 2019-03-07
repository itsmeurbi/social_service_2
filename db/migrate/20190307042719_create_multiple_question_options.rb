class CreateMultipleQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_question_options do |t|
      t.string :content
      t.integer :type
      t.references :multiple_question, foreign_key: true
      
      t.timestamps
    end
  end
end
