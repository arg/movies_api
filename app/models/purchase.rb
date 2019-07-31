class Purchase < ApplicationRecord
  DURATION = 2.days

  enum option: { price: 0, quality_hd: 1, quality_sd: 2 }

  belongs_to :user

  belongs_to :item

  scope :active, -> { where('expires_at > ?', Time.current) }

  validates :option, presence: true

  validates :item_id, uniqueness: { scope: [:user_id], conditions: -> { active } }

  before_create { self.expires_at ||= DURATION.from_now }
end
