module Purchasable
  extend ActiveSupport::Concern

  included do
    has_many :purchases, as: :purchasable, dependent: :destroy
  end

  def purchase_by(user, option)
    user.purchases.create!(purchasable: self, option: option)
  end
end
