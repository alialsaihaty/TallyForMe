Rails.application.routes.draw do



  get 'dashboard/index'
  get 'home/subscribe'
  get 'invoices/invo1'

  resources :clients
  resources :addresses
  resources :phones
  resources :emails

  resources :companies

  resources :invoices

  resources :items
  resources :services

  resources :users, only: [:new, :create] do
    collection do
      get   :edit
      patch :update
    end
  end

  resources :sessions, only: [:new, :create] do
    # this will create for us a route with DELETE http verb and /sessions
    # adding the on: :collection option will make it part of the routes for
    # sessions which means it won't prepend the routes with /sessions/:session_id
    delete :destroy, on: :collection
  end



  root 'home#index'

end
