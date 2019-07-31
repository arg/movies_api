class Item < ApplicationRecord
  include ItemValidations

  has_many :purchases, dependent: :destroy

  scope :order_by_created, -> { order(created_at: :asc) }
end
