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

    redirect_to "/shelters/#{shelter.id}/pets"
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
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  def change_adoption_status
    pet = Pet.find(params[:id])
      if pet.adoption_status == "adoptable"
        status = "pending"
      else
        status = "adoptable"
      end
    pet.update({adoption_status: status})
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  private

    def pet_params
      params.permit(:image, :name, :description, :age, :sex)
    end
end
