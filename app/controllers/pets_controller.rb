# app/controllers/pets_controller.rb

class PetsController < ApplicationController
  skip_before_action :ensure_user_not_mobile, only: :index

  def index
    @pets=Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      redirect_to pet_path(pet)
    else
      render text: pet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    pet = Pet.find(params[:id])

    if pet.update(pet_params)
      redirect_to pet_path(pet)
    else
      render text: pet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to pet_path
  end

  private

  def pet_params
    params.permit(:name, :breed, :color)
  end

end
