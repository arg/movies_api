class Movie < ApplicationRecord
  include MovieValidations, Purchasable
end
