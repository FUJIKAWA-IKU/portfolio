class Training < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :trainingday, { presence: true }
  validates :parts, { presence: true }
  validates :time, presence: true, numericality: { less_than_or_equal_to: 300 }
  validates :user_id, { presence: true }
end
