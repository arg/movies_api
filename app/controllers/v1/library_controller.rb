class V1::LibraryController < ApplicationController
  # pagination is a must
  def all
    @items = Item.order_by_created
  end

  def movies
    @movies = Movie.order_by_created
  end

  def seasons
    @seasons = Season.includes(:episodes).order_by_created
  end
end
