class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :category
      t.string :title
      t.integer :amount
      
      t.timestamps
    end
  end
end
