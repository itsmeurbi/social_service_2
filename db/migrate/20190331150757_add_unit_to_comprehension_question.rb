class AddUnitToComprehensionQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :comprehension_questions, :unit, foreign_key: true
  end
end
