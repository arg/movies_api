class User < ApplicationRecord
  has_many :purchases, -> { active }, dependent: :destroy

  validates :email, presence: true, email: true, length: { maximum: 160 },
    uniqueness: { case_sensitive: false }
end
