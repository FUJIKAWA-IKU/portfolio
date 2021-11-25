class Training < ApplicationRecord
  validates :trainingday, { presence: true }
  validates :parts, { presence: true }
  validates :time, { presence: true }
  validates :user_id, { presence: true }
end
