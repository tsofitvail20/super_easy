Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :items
  resources :archives do
    collection do
      get 'purchase'
      post 'error'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
