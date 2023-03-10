class CreateEmploycomment < ActiveRecord::Migration[7.0]
  def change
    create_table :employcomments,id: :uuid do |t|
      t.string :expense_id
      t.string :comment
      t.string :commenter_id
      t.timestamps
    end
  end
end
