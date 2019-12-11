class FavoritesController < ApplicationController

  def index
    @pets = favorites.favorite_pets.map do |pet|
      Pet.find(pet.first)
    end
    @applied_pets = Pet.select('pets.name, pets.id').joins(:applications)
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.favorite_pets
    flash[:notice] = "#{pet.name} has been added to Favorites!"

    redirect_to ("/pets/#{pet.id}")
  end

  def destroy
    if params[:pet_id]
      pet = Pet.find(params[:pet_id])
      favorites.remove_pet(pet.id)
      flash[:notice] = "#{pet.name} has been removed from Favorites!"
    else
      favorites.remove_all
      flash[:notice] = "Your favorited pets have been removed"
    end
    session[:favorites] = favorites.favorite_pets
    redirect_back fallback_location: :back
  end
end
