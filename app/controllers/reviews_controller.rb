class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = @shelter.reviews.new(reviews_params)

    redirect_to "/shelters/#{@shelter.id}"
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = @shelter.reviews.new(reviews_params)
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
      else
        flash[:notice] = "Review not created - Please complete required fields"
        redirect_to "/shelters/#{@shelter.id}/reviews/new"
      end
  end

  def edit
    @shelter = params[:shelter_id]
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(reviews_params)

    if @review.save
      redirect_to "/shelters/#{params[:shelter_id]}"
    else
      flash[:notice] = "Title, rating, and content must be filled out"
      @shelter = params[:shelter_id]
      render :edit
    end
  end

  private

    def reviews_params
      params.permit(:title, :rating, :content, :picture)
    end




end
