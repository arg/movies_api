class Episode < ApplicationRecord
  include MovieValidations

  belongs_to :season

  acts_as_list scope: :season
end
