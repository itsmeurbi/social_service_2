class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.date :date
      t.float :grade

      t.timestamps
    end
  end
end
