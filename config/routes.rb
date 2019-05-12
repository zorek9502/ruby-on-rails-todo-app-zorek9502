Rails.application.routes.draw do
  resources :task_lists do
    resources :tasks
  end
  resources :profiles
  devise_for :users
  root "profiles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
