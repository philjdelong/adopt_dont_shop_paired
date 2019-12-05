class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    review = @shelter.reviews.new(reviews_params)

    redirect_to "/shelters/#{@shelter.id}"
  end

  private

    def reviews_params
      params.permit(:title, :rating, :content, :picture)
    end




end
