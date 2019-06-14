class AddAttributesToExamQuest < ActiveRecord::Migration[5.2]
  def change
    add_column :exam_quests, :status, :integer
    add_column :exam_quests, :chosed_answ, :integer
  end
end
