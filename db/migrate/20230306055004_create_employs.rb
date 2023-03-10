class CreateEmploys < ActiveRecord::Migration[7.0]
  def change
    create_table :employs,id: :uuid do |t|
      t.string :name
      t.string :role
      t.string :emp_status
      t.string :department
      t.string :email,unique: true
      t.string :address
      t.string :password_digest
      t.timestamps
    end
  end
end
