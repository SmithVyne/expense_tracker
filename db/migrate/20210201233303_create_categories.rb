class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.references :user
      t.string :name
      t.integer :limit

      t.timestamps
    end
  end
end
