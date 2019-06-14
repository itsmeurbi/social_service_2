class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.integer :result
      t.datetime :date
      #t.references :period, foreign_key: true

      t.timestamps
    end
  end
end
