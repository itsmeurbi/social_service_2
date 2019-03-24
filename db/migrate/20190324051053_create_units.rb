class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :number
      t.string :name

      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
