class AddReferencesToExams < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :level, foreign_key: true
    add_reference :exams, :period, foreign_key: true
    add_reference :exams, :student, foreign_key: true
    add_reference :exams, :user, foreign_key: true
  end
end
