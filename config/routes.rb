Rails.application.routes.draw do

  get '/', to: 'home#index'
  get '/shelters', to: 'shelters#index'
  get '/pets/', to: 'pets#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/pets/:id', to: 'pets#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/pets', to: 'shelters#pets_index'
  get '/shelters/:id/pets/new', to: 'shelters#pets_new'
end
