Rails.application.routes.draw do
  root 'welcome#index'

  resources :terms
  resources :subjects
  resources :undergraduates

  resources :students

  resources :sessions, only: [:index, :new, :create]

  resources :advisors do
    resources :sessions, only: [:index, :new, :create]
  end

  resources :advices

  resources :applications, only: [:index]

  namespace :applications do
    resources :students, only: [:index, :show]
    get 'students/accept/:id', to: 'students#accept', as: 'student_accept'
    get 'students/reject/:id', to: 'students#reject', as: 'student_reject'

    resources :advisors, only: [:index, :show]
    get 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    get 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'
  end
end
