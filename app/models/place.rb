class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, :phone, :address, :website, :user_id, presence: true

  geocoded_by :address
  after_validation :geocode

  def average_rating
    (self.reviews.sum(:score) / reviews.size.to_f).round
    rescue
      0
  end

end
