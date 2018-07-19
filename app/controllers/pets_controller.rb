class PetsController < ApplicationController

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
      redirect_to user_path(@current_user)
    else
      redirect_to user_path(@current_user)
    end
  end

  def destroy
    find_pet
    unless !@current_user == @pet.user
      redirect_to user_path(@current_user)
    else
      @pet.delete
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
