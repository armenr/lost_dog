Rails.application.routes.draw do
  get 'pets/new' => 'pets#new', as: :new_pet
  get '/pets' => 'pets#index'
  get 'pets/:id' => 'pets#show', as: :pet
  post '/pets' => 'pets#create'
  patch '/pets/:id' => 'pets#update'
  delete 'pets/:id' => 'pets#destroy'

  get '/mobile' => 'application#mobile'
end
