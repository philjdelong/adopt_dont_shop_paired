class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @applied_pets = @application.pets
  end

  def index
    @pet = Pet.find(params[:pet_id])
  end

  def new
    @pets = Pet.find(favorites.favorite_pets.keys)
  end

  def create
    application = Application.new(app_params)
    if application.save
      ids = params[:apply_for]
      applicants = Pet.find(params[:apply_for])

      faves = favorites.remove_type(ids)
      application.pets << applicants
      flash[:success] = "Your application has been sent!"
      redirect_to "/favorites"
    else
      flash.now[:error] = 'Application not submitted. Please complete all required fields.'
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
