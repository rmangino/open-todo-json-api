Rails.application.routes.draw do

  resources :lists, only: [:index, :show, :create, :update, :destroy]

end
