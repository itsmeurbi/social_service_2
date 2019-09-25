class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :area
      t.string :position
      t.string :signing

      t.timestamps
    end
  end
end
