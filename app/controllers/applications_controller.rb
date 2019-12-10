class ApplicationsController < ApplicationController

  def new
    @pets = Pet.find(favorites.favorite_pets.keys)
  end

  def create
    app = Application.new(app_params)
    if app.save
      ids = params[:favorite_pet_ids]
      faves = Favorites.new(ids)
      pets = Pet.find(params[:favorite_pet_ids])
      app.pets << pets
      faves.remove_all
      session[:favorites] = faves.favorite_pets
      app.update_adoption_status(pets)
      flash[:success] = "Your application has been sent!"
      redirect_to "/favorites"
    else
      flash.now[:error] = 'Application not submitted. Please complete required fields.'
      @pets = Pet.find(favorites.favorite_pets.keys)
      render :new
    end
  end

  private
      def app_params
        params.permit(:name,
                      :address,
                      :city,
                      :state,
                      :zip,
                      :phone_number,
                      :description)
      end

end
