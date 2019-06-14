class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.date :date
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
