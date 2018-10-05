Rails.application.routes.draw do
  root 'welcome#index'

  resources :semesters
  resources :subjects
  resources :undergraduates
  resources :students
  resources :classrooms

  resources :sessions, only: [:index, :new, :create]

  resources :advisors do
    resource :schedule, only: [:show, :new, :create]
  end
  
  resources :advices
  resources :surveys

  resources :applications, only: [:index]

  namespace :applications do
    resources :students, only: [:index, :show]
    post 'students/accept/:id', to: 'students#accept', as: 'student_accept'
    post 'students/reject/:id', to: 'students#reject', as: 'student_reject'

    resources :advisors, only: [:index, :show]
    post 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    post 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'
  end
end
