Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :members
  devise_for :admins, ActiveAdmin::Devise.config

  # below code to fix the active admin issue when table not exists in database as activeadmin tries to load every model.
  # for reference https://github.com/activeadmin/activeadmin/issues/783
  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end
  root to: "home#index"

  resources :cooperatives, only: [:index, :show, :edit, :update] do
    resources :plants, only: [:index, :show, :new, :create, :edit, :update]
    resources :members, only: [:index, :update]
    get 'files', to: 'coop_files#index'
    get 'files/:id', to: 'coop_files#show'
    get 'customer_data', to: 'customer_data#index'
    get 'calculator', to: 'cooperatives#calculator'
  end
  resources :groups, only: [:index, :show]
  resources :fileclips, only: [:index], path: :files

end
