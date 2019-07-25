class Purchase < ApplicationRecord
  DURATION = 2.days

  enum option: { price: 0, quality_hd: 1, quality_sd: 2 }

  belongs_to :user

  belongs_to :purchasable, polymorphic: true

  scope :active, -> { where('expires_at > ?', Time.current) }

  validates :option, presence: true

  validates :purchasable_id, uniqueness: { scope: [:purchasable_type, :user_id],
    conditions: -> { active } }

  before_create { self.expires_at ||= DURATION.from_now }
end
