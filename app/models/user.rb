class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :trainings, dependent: :destroy
  validates :name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password, { presence: true, uniqueness: true }
end
