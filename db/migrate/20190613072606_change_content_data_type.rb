class ChangeContentDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :comprehension_questions, :lecture, :longtext
  end
end
