class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, :address, :user_id, presence: true

  after_validation :geocode
  geocoded_by :address
  

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
