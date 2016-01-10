class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, :phone, :address, :website, :user_id, presence: true

  geocoded_by :address
  after_validation :geocode

  def cal_average_rating
    (self.reviews.sum(:score) / reviews.size.to_f).round
    rescue
      0
  end

  def self.search(search)
    if search
      where(['name LIKE ? OR address LIKE ?', "#{search}", "#{search}"])
    else
      all
    end
  end


end
