Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :clients, only: [:index, :show]
      resources :transactions, only: [:index]
      get "clients/:id/transactions", to:"transactions#transactions_by_client"

    end
  end


end
