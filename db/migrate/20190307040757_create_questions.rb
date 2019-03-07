class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :type
      t.timestamps
    end
    add_reference :questions, :author, foreign_key: { to_table: :users }
  end
end
