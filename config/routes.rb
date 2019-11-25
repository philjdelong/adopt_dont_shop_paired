Rails.application.routes.draw do

  get '/', to: 'home#index'
  get '/pets/', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelters#pets_index'
  get '/shelters/:shelter_id/pets/new', to: 'shelters#pets_new'
  post 'shelters/:shelter_id/pets', to: 'shelters#pets_create'
end
