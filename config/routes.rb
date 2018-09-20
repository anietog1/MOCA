Rails.application.routes.draw do
  resources :advices
  resources :advisors
  resources :undergraduates
  resources :subjects
  resources :terms
  resources :students

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
