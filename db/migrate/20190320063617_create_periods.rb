class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.date :starts_at
      t.date :ends_at
      t.references :editorial, foreign_key: true

      t.timestamps
    end
  end
end
