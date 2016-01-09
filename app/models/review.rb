class Review < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates :content, :score, presence: true

  after_save :update_average
  
  def update_average
    a = self.place.cal_average_rating
    self.place.update_attributes(average_rating: a)
  end
end
