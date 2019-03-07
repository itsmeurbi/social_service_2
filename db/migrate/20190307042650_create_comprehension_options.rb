class CreateComprehensionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :comprehension_options do |t|
      t.string :content
      t.integer :type
      t.references :comprehension_question, foreign_key: true

      t.timestamps
    end
  end
end
