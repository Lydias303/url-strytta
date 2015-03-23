Rails.application.routes.draw do

  root 'welcome#index'

  resources :url, except: [:edit, :new]
end
