class AddNameToLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :name, :string
  end
end
