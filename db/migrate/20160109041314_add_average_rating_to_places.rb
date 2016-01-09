class AddAverageRatingToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :average_rating, :integer, default: 0
  end
end
