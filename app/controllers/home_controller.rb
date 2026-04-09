class HomeController < ApplicationController
  def index
    @featured_items = Item.limit(4)
  end
end