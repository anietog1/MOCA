Rails.application.routes.draw do
  resources :advisors
  resources :undergraduates
  resources :subjects
  resources :terms
  resources :students

  resources :applications, only: [:index]
  namespace :applications do
    resources :advisors, only: [:index, :show]
    get 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    get 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'
  end

  get 'appstudents/validate'
  get 'appstudents/validate/:id', to: 'appstudents#validate', as: 'validating'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :appstudents
end
