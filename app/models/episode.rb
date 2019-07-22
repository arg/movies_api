class Episode < ApplicationRecord
  include MovieValidations

  belongs_to :season
end
