class AddReferencesToExamQuest < ActiveRecord::Migration[5.2]
  def change
    add_reference :exam_quests, :multiple_question, foreign_key: true
    add_reference :exam_quests, :exam, foreign_key: true
  end
end
