Rails.application.routes.draw do
  get 'pets/new' => 'pets#new', as: :new_pet
  get '/pets' => 'pets#index'
  get 'pets/:id' => 'pets#show', as: :pet
  get 'pets/:id/edit' => 'pets#edit', as: :edit_pet
  post '/pets' => 'pets#create'
  patch '/pets/:id' => 'pets#update'
  delete 'pets/:id' => 'pets#destroy'

  get '/mobile' => 'application#mobile'
  get 'sessions/new' => 'sessions#new', as: :new_sessions
  post 'sessions' => 'sessions#create', as: :sessions
  delete 'sessions' => 'sessions#destroy'

end
