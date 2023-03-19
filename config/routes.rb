Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms do
    
    collection do
      get "myrooms"
    end
    
    resources :reservations, only: [:index, :new, :create, :show] do
      
      collection do
        post :confirm
      end
      
    end
    
    
  end
  
  get 'search', to: 'rooms#search'
end
