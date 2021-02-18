class Park < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name, :address, :image
  end
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
