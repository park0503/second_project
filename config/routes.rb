Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "home#index"
resources :posts do
  collection do
    #id가 필요없는애
    get :my
  end

  member do
    #id가 필요한 애
  end
end
resources :comments
resources :likes
post '/post/:post_id/toggle' => 'posts#toggle'
end
