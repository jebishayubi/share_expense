class CreateProcessingfees < ActiveRecord::Migration[7.0]
  def change
    create_table :processingfees do |t|
      t.integer :amount
      t.timestamps
    end
  end
end
