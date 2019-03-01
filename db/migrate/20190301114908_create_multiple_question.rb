class CreateMultipleQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_questions do |t|
      t.string :content
      t.integer :value
    end
  end
end
