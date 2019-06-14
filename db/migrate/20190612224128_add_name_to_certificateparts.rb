class AddNameToCertificateparts < ActiveRecord::Migration[5.2]
  def change
    add_column :certificate_parts, :name, :string
  end
end
