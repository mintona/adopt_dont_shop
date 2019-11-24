class PetsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    pet = Pet.new(pet_params)
    pet.shelter_id = params[:shelter_id]
    pet.save!
    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  private
    def pet_params
      params.permit(:image, :name, :description, :approximate_age, :sex)
    end

end
