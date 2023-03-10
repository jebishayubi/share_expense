class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses,id: :uuid do |t|
      t.references :employ,foreign_key: true,type: :uuid
      t.string :description
      t.integer :amount
      t.integer :invoice_number
      t.string :expense_type
      t.string :document
      t.date :date
      t.string :comment
      t.string :reply
      t.integer :approvalstatus
      t.timestamps
    end
  end
end
