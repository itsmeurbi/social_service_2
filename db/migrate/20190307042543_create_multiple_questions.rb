class CreateMultipleQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_questions do |t|
      t.string :content
      t.integer :value
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
