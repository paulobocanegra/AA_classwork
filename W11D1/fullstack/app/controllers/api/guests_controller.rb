class Api::GuestsController < ApplicationController
  def index
    @guests = Guest.all
    render :index
  end

  def show
    @guest = Guest.find_by(id: params[:id])
    render :show
  end
end

# Guests
#   Api::Guests#show
#     the resource is under the correct namespace (FAILED - 1)
#     the show page shows correct information (FAILED - 2)
#     the show page doesn't show too much information (FAILED - 3)
#   Api::Guests#index
#     the resource is under the correct namespace (FAILED - 4)
#     the index page shows multiple guests (FAILED - 5)
#     the index page doesn't show too much information (FAILED - 6)
#   Guests' Gifts
#     show page shows a guest's gifts (FAILED - 7)
#     index page doesn't show guests' gifts (FAILED - 8)