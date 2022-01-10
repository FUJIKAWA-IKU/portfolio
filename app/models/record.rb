class Record < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :runday, { presence: true }
  validates :distance, presence: true, numericality: { less_than_or_equal_to: 100 }
  validates :time, presence: true, numericality: { less_than_or_equal_to: 600 }
  validates :user_id, { presence: true }
end
