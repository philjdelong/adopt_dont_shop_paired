class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  private

    def pet_params
      params.permit(:image, :name, :description, :age, :sex)
    end
end
