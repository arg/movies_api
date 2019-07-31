class Season < Item
  has_many :episodes, -> { order(position: :asc) }, dependent: :destroy
end
