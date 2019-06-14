class CreateExamQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_quests do |t|

      t.timestamps
    end
  end
end
