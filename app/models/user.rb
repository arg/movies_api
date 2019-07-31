class User < ApplicationRecord
  has_many :purchases, -> { active }, dependent: :destroy

  has_many :items, through: :purchases

  validates :email, presence: true, email: true, length: { maximum: 160 },
    uniqueness: { case_sensitive: false }
end
