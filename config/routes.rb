Rails.application.routes.draw do
  scope module: :end_users do
    root to: 'homes#top'
  end
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
