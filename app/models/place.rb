class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, :phone, :address, :website, :user_id, presence: true

  geocoded_by :address
  after_validation :geocode
end
