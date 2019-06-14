class CreateCertificateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :certificate_parts do |t|
      t.string :header
      t.text :body
      t.string :footer
      #t.references :certificate, foreign_key: true

      t.timestamps
    end
  end
end
