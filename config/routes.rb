Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :members
  devise_for :admins, ActiveAdmin::Devise.config

  # below code to fix the active admin issue when table not exists in database as activeadmin tries to load every model.
  # for reference https://github.com/activeadmin/activeadmin/issues/783
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  root to: "home#index"

  get '/members', to: redirect('/members/sign_in')

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :cooperatives, concerns: :paginatable, only: [:index, :show, :edit, :update] do
    resources :plants, only: [:index, :show, :new, :create, :edit, :update]
    resources :members, only: [:index]
    post 'members', to: 'members#update'
    get 'customer_data', to: 'customer_data#index'
    get 'diagrams', to: 'customer_data#diagrams'
    get 'calculator', to: 'cooperatives#calculator'
  end
  resources :fileclips, only: [:index, :show], path: :files

end
