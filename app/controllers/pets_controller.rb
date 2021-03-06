# app/controllers/pets_controller.rb

class PetsController < ApplicationController
  skip_before_action :ensure_user_not_mobile, only: :index

  def index
    @pets=Pet.all
  end

  def show
    @pet = Pet.find(params[:id]).decorate
  end

  def new
    binding.pry
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      flash[:notice] = "Pet created successfully!"
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :color, :last_seen_at)
  end

end
