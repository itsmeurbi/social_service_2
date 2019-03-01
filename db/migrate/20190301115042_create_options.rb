class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :content
      t.integer :type
      t.references :question, foreign_key:
    end
  end
end
