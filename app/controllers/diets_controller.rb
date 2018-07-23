class DietsController < ApplicationController

  def new
    @diet = Diet.new(pet_id: params[:pet_id])
  end

  def create
    @diet = Diet.new(diet_params)
    binding.pry
      if @diet.valid?
        @diet.save
        redirect_to pet_path(@diet.pet_id)
      else
        redirect_to new_pet_diet_path
      end
  end

  def show
    @diet = Diet.find(params[:id])
  end

  private

  def diet_params
    params.require(:diet).permit(:name, :pet_id, :food_id)
  end

end
