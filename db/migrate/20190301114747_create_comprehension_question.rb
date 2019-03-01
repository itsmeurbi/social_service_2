class CreateComprehensionQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :comprehension_questions do |t|
      t.string :content
      t.integer :value
      t.references :lecture, foreign_key: true
    end
  end
end
