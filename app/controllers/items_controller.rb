class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index 
    items = Item.all
    render json: items, include: :user
  end 

  private 

  def find_item
    Item.find(params[:id])
  end 

  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end 

end
