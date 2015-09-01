Rails.application.routes.draw do

  resource  :sessions,  only: [:create, :destroy]

  resources :lists, only: [:index, :show, :create, :update, :destroy] do
    resources :items, except: [:new]
  end

end
