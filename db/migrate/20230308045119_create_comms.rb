class CreateComms < ActiveRecord::Migration[7.0]
  def change
    create_table :comms,id: :uuid do |t|
      t.references :expense,foreign_key: true,type: :uuid
      t.string :comment
      t.string :commenter_id
      
      t.timestamps
    end
  end
end
