Rails.application.routes.draw do
  get 'users/show'
  resources :tasks
  resources :users, only: [:show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_up', to: "users/registrations#new"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
