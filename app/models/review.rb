class Review < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates :content, :score, presence: true
end
