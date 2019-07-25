class Season < ApplicationRecord
  include MovieValidations, Purchasable

  has_many :episodes, -> { order(position: :asc) }, dependent: :destroy
end
