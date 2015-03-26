Rails.application.routes.draw do

  root 'welcome#index'

  resources :urls

  namespace :api do
    namespace :v1 do
      resources :url, except: [:edit, :new]
    end
  end
end
