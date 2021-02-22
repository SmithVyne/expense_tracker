class Expense < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :amount, presence: true
end
