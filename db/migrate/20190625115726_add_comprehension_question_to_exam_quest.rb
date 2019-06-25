class AddComprehensionQuestionToExamQuest < ActiveRecord::Migration[5.2]
  def change
    add_reference :exam_quests, :comprehension_question, foreign_key: true
  end
end
