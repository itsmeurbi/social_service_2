class AddReferenceToCertificates < ActiveRecord::Migration[5.2]
  def change
    add_reference :certificates, :certificate_parts, foreign_key: true
  end
end
