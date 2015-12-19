class Review < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates :content, presence: true
end
