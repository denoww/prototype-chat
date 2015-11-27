Rails.application.routes.draw do
  root 'historic#index'

  resources :historico, controller: :historic
end
