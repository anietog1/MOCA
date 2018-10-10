Rails.application.routes.draw do
  post 'advices/create', to: 'advices#create', as: 'advice_create'
  get 'advices', to: 'advices#index', as: 'advices'
  get 'advices/new', to: 'advices#new', as: 'new_advice'
  get 'advices/show', to: 'advices#show',as: ''
  root 'welcome#index'
  resources :environments

  resources :semesters
  resources :subjects
  resources :undergraduates
  resources :students
  resources :classrooms

  resources :sessions, only: [:index, :new, :create]

  resources :advisors do
    resource :schedule, only: [:show, :new, :create]
  end

  resources :surveys

  resources :applications, only: [:index]

  namespace :applications do
    resources :students, only: [:index, :show]
    post 'students/accept/:id', to: 'students#accept', as: 'student_accept'
    post 'students/reject/:id', to: 'students#reject', as: 'student_reject'
    get 'meetings/create', to: 'meetings#create', as: 'meetings_create'

    resources :advisors, only: [:index, :show]
    post 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    post 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'
  end
end
