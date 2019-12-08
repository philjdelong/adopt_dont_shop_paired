class FavoritesController < ApplicationController

  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.favorite_pets
    flash[:notice] = "#{pet.name} has been added to Favorites!"

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorites.remove_pet(pet.id)
    session[:favorites] = favorites.favorite_pets
    flash[:notice] = "#{pet.name} has been removed from Favorites!"

    redirect_to "/pets/#{pet.id}"
  end

  def index
    @pets = favorites.favorite_pets.map do |pet|
      Pet.find(pet.first)
    end
  end
end
