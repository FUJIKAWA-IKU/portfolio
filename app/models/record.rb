class Record < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :runday, { presence: true }
  validates :distance, { presence: true }
  validates :time, { presence: true }
  validates :user_id, { presence: true }
end
