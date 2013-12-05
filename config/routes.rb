Citibike::Application.routes.draw do
  resources :searches, only: [:new, :create, :index]
  resources :exchanges do
    member do
      put 'claim'
      put 'confirm'
    end
  end
  
  resources :users do
    resources :favorites
      member do
        post 'favorite'
      end  
  end

  resources :charges
  
  get 'account' => 'welcome#account'
  root 'welcome#index'
  resource :session, only: [:destroy, :create, :new]
end
