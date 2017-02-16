Rails.application.routes.draw do
  get '/error', to: 'tests#error'
  get '/test', to: 'tests#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
