Rails.application.routes.draw do
  devise_for :workers
  devise_for :users
  root 'landing#index'

  resources :jobs
  resources :workers do
    post :claim_job
  end
end
