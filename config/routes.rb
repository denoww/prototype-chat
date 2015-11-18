Rails.application.routes.draw do
  root 'cobrancas#index'

  resources :cobrancas
  resources :recebimentos, only: [:create, :destroy] 
  resources :composicao_cobrancas, only: [:create, :destroy] 
  post '/recebimentos/calcular_divida', to: 'recebimentos#calcular_divida'
end