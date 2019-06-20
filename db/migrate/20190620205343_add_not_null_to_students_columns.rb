class AddNotNullToStudentsColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :students, :name, false
    change_column_null :students, :no_control, false
    change_column_null :students, :email, false
  end
end
