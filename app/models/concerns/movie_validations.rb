module MovieValidations
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true, length: { maximum: 160 }
    validates :plot, presence: true, length: { maximum: 500 }
  end
end
