Rails.application.routes.draw do
post 'sign_up', to: 'sessions#sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
