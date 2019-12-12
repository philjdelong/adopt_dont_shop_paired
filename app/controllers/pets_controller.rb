class PetsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    end
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)
    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
    else
      flash[:notice] = "(please complete all fields)"
      redirect_to "/shelters/#{shelter.id}/pets/new"
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @shelter_id = params[:shelter_id]
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
      if params[:application_id]
        if pet.adoption_status == "Adoptable"
          pet[:adoption_status] = "Adoption Pending..."
        elsif pet.adoption_status == "Adoption Pending..."
          pet[:adoption_status] = "Adoptable"
        end
      end
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    favorites.remove_pet(params[:id])
    session[:favorites] = favorites.favorite_pets
    pet = Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private

    def pet_params
      params.permit(:image, :name, :description, :age, :sex)
    end
end
