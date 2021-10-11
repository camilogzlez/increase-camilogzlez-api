# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :clients, only: %i[index show]
      resources :transactions, only: [:index]
      get 'clients/:id/transactions', to: 'clients#transactions_by_client'
      get 'clients/:id/balance', to: 'clients#client_balance'
    end
  end
end
