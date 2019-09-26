class CreateJoinTableEmployeeCertificate < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :certificates do |t|
      t.index [:employee_id, :certificate_id]
    end
  end
end
