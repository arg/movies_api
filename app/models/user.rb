class User < ApplicationRecord
  validates :email, presence: true, email: true, length: { maximum: 160 },
    uniqueness: { case_sensitive: false }
end
