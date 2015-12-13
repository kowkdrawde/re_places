class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, :phone, :address, :website, :user_id, presence: true
end
