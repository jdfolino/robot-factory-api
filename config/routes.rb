Rails.application.routes.draw do
  resources :robots, only: [:index, :update] do
    scope module: :robots do
      resource :extinguish, only: [:create]
      resource :approval, only: [:create]
    end
  end

  scope module: :robots do
    post 'robots/recycle', to: 'recycle#create'
  end

  put 'shipments/create', to: 'shipments#update'
end
