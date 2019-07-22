class Season < ApplicationRecord
  include MovieValidations

  has_many :episodes, -> { order(position: :asc) }, dependent: :destroy
end
