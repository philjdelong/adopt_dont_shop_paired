class ApplicationsController < ApplicationController

  def new
    @pets = Pet.find(favorites.favorite_pets.keys)
  end

  def create
    flash[:notice] = 'Your application has been submitted successfully!'
    redirect_to '/favorites'
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
