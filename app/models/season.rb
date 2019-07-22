class Season < ApplicationRecord
  include MovieValidations

  has_many :episodes
end
