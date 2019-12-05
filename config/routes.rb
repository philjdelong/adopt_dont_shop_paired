Rails.application.routes.draw do

  get '/', to: 'home#index'
  get '/pets/', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  post '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelters#pets_index'
  get '/shelters/:shelter_id/pets/new', to: 'shelters#pets_new'
  post '/shelters/:shelter_id/pets', to: 'shelters#pets_create'

  get '/shelters/:id/reviews/new', to: 'reviews#new'
  post '/shelters/:id', to: 'reviews#create'

end
