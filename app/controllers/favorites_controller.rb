class FavoritesController < ApplicationController

  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.favorite_pets

    flash[:notice] = "#{pet.name} has been added to Favorites!"
    redirect_to "/pets/#{pet.id}"
  end
end
