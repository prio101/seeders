Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'api' do
    resources :campaigns, only: [:index]
    resources :investments, only: %i[index create]
  end
end
