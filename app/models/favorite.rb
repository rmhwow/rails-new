class Favorite < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  # has_many :posts, dependent: :destroy
  # has_many :users, dependent: :destroy
end
