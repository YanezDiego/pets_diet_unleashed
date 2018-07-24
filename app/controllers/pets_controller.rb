class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = @current_user.pets.build(pet_params)
      if @pet.valid?
        @pet.save
        redirect_to new_pet_diet_path(@pet)
      else
        redirect_to new_pet_path #flash Message
      end
  end

  def show
    find_pet
  end

  def edit
    find_pet
  end

  def update
    if logged_in? && @current_user
      find_pet
      @pet.update(pet_params)
      @pet.save
      redirect_to pets_path
    else
      redirect_to user_path(@current_user)
    end
  end

  def destroy
    @pet = @current_user.pets.find_by(id: params[:id])
    if @pet == @pet.destroy
      redirect_to user_path(@current_user)
    else
      redirect_to user_path(@current_user)
    end
  end


  private

  def find_pet
    @pet = Pet.find_by(id: params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species)
  end

end
