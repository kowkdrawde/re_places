class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    redirect_to dashboard_path if current_user
  end

  def dashboard
    @user = current_user
    @places = @user.places.paginate(page: params[:places_page], per_page: 10)
    @reviews = @user.reviews.paginate(page: params[:reviews_page], per_page: 10)
  end

end
