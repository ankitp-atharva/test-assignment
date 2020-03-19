Rails.application.routes.draw do
  resources :followings, only: [:index]
  resources :answers
  resources :topics do
    collection do
      get :followings
    end
  end
  resources :questions
  get 'follow_user/:question_id/:user_id', to: 'home#follow_user', as: :follow_user
  get 'follow_topic/:question_id/:topic_id', to: 'home#follow_topic', as: :follow_topic

  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
