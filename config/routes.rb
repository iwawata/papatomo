Rails.application.routes.draw do

  get 'tests/index'
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "end_users/registrations",
    sessions: 'end_users/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end


  scope module: :end_users do
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:edit, :update] do
      member do
        get 'details' => 'users#details'
      end
      collection do
        get 'my_page' => "users#show"
        get 'users/unsubscribe'
        patch 'users/withdraw'
      end
    end
    root to: 'homes#top'
    get "search" => "searches#search"
  end

  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
