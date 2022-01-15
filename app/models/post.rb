class Post < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :content, { presence: true, length: { maximum: 140 } }
  validates :user_id, { presence: true }
end
