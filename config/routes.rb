Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  authenticated :user, ->(user) { user.admin? } do
    get 'admin_home', to: 'home#index', as: :admin_home
  end

  authenticated :user, ->(user) { user.client? } do
    get 'client_home', to: 'home#index', as: :client_home
  end
end