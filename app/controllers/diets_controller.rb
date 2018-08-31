class DietsController < ApplicationController

  def new
    if params[:pet_id] && !Pet.exists?(params[:pet_id])
      redirect_to pet_path, alert: 'Pet not found'
    else
      @diet = Diet.new(pet_id: params[:pet_id])
    end
  end

  def index
    diet = Diet.all
    render json: diet
  end

  def create
    @diet = Diet.new(diet_params)
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

  def edit
    if params[:pet_id]
      pet = Pet.find_by(id: params[:pet_id])
      if pet.nil?
        redirect_to pet_path, alert: "Pet not found."
      else
        @diet = pet.diets.find_by(id: params[:id])
        redirect_to pet_path(pet), alert: "Diet not found." if @diet.nil?
      end
    else
      @diet = Diet.find(params[:id])
    end
  end

  def update
    @diet = Diet.find_by(id: params[:id])
    @diet.update(diet_params)
    @diet.save
    redirect_to pets_path
  end

  def destroy
    @diet = Diet.find_by(id: params[:id])
    if @diet == @diet.destroy
      redirect_to pets_path
    else
      redirect_to user_path(@current_user)
    end
  end

  private


  def diet_params
    params.require(:diet).permit(:name, :pet_id, :food_id)
  end

end
