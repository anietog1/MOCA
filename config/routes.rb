Rails.application.routes.draw do
  get 'appstudents/validate'
  get 'appstudents/validate/:id', to: 'appstudents#validate', as: 'validating'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :applications
  resources :appstudents
end
