class AddTotalToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :total, :integer
  end
end
