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
    shelter = Shelter.create(shelter_params)
    if shelter.save
      redirect_to '/shelters'
    else
      flash[:notice] = "(please complete all fields)"
      render :new
    end
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
    statuses = Pet.select('pets.adoption_status').where(shelter_id: params[:id])
      if statuses.count > 0 
        flash[:notice] = "Cannot delete pets with pending applications"
      else
        Pet.delete(Pet.where(shelter_id: params[:id]))
        Review.delete(Review.where(shelter_id: params[:id]))
        PetsApplication.delete(Pet.where(shelter_id: params[:id]))
        Shelter.destroy(params[:id])
      end
    # Review.delete(Review.where(shelter_id: params[:id]))
    # PetsApplication.delete(Pet.where(shelter_id: params[:id]))
    # Pet.delete(Pet.where(shelter_id: params[:id]))
    # Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private

    def shelter_params
      params.permit(:name, :address, :city, :state, :zip)
    end

end
