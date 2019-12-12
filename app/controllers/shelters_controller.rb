class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
    @reviews = @shelter.reviews
    @pending = @shelter.pending_pets
  end

  def new
  end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to '/shelters'
  end

  def destroy
    Review.delete(Review.where(shelter_id: params[:id]))
    Pet.delete(Pet.where(shelter_id: params[:id]))
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private

    def shelter_params
      params.permit(:name, :address, :city, :state, :zip)
    end

end
