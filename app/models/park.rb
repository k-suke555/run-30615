class Park < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  with_options presence: true do
    validates :name, :address, :image
  end
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :area_id, numericality: { other_than: 1 }
end
