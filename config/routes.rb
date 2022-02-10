Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/health', to: 'health#health'
  resources :categories, only: [:index, :show, :create, :update, :destroy]

  #todo.... Hacer las rutas para las tasks
end

