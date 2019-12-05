class ReviewsController < ApplicationController

  def new
<<<<<<< HEAD
    @shelter = Shelter.find(paramsgit[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    review = @shelter.reviews.new(reviews_params)

    redirect_to "/shelters/#{@shelter.id}"
=======
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

    # redirect_to "/shelters/#{@shelter.id}"
  end

  def edit
    @shelter = params[:shelter_id]
    @review = Review.find(params[:review_id])
  end

  def update
    @review = Review.find(params[:review_id])
    @review.update(reviews_params)

    if @review.save
      redirect_to "/shelters/#{params[:shelter_id]}"
    else
      flash[:notice] = "Title, rating, and content must be filled out"
      @shelter = params[:shelter_id]
      render :edit
    end
>>>>>>> 2cf968388cb162deb13b4aca8a504327a26fc4b0
  end

  private

    def reviews_params
      params.permit(:title, :rating, :content, :picture)
    end




end
