class AddUnitToMultipleQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :multiple_questions, :unit, foreign_key: true
  end
end
