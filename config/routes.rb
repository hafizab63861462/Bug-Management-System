Rails.application.routes.draw do
   devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations',
        confirmations: 'users/confirmations'
      }

  root 'home#index'
  get 'error', to: 'home#show'
  resources :projects do
    resources :bugs
  end

  get '/projects/:id/:uid' , to: 'projects#assignUserToProject', as: 'userAssignToProject'

  get '/projects/:id/bugs/:bid/:uid' , to: 'bugs#assignUserToBug', as: 'userAssignToBug'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
