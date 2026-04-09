class SearchController < ApplicationController
  def index
    @query = params[:q].to_s.strip
    @items = if @query.present?
               Item.where("name LIKE ?", "%#{@query}%")
             else
               []
             end
  end
end