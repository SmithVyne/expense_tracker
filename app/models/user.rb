class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  validates :username, presence:true, uniqueness:true,
              length: { maximum:20 }
end
