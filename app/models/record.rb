class Record < ApplicationRecord
  validates :runday, { presence: true }
  validates :distance, { presence: true }
  validates :time, { presence: true }
  validates :user_id, { presence: true }
end
