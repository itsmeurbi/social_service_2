class CreateLecture < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :content
      t.integer :value
    end
  end
end
