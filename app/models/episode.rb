class Episode < ApplicationRecord
  include ItemValidations

  belongs_to :season

  acts_as_list scope: :season
end
