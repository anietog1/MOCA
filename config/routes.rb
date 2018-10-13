Rails.application.routes.draw do
  post 'advisors/:advisor_id/grade', to: 'grades#update', as: 'advisor_grade'
  root 'welcome#index'
  resources :environments
  resources :semesters
  resources :subjects
  resources :undergraduates
  resources :students
  resources :classrooms
  resources :sessions, only: [:index, :new, :create]
 # resources :grades
  resources :advisors do
    resource :schedule, only: [:show, :new, :create]
    resource :grade, only: [:show, :update]
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
