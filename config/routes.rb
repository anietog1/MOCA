Rails.application.routes.draw do
  get 'students/validate/:id', to: 'students#validate', as: 'students_validate'
  post 'students/accept/:id', to: 'students#accept', as: 'students_accept'
  post 'students/reject/:id', to: 'students#reject', as: 'students_reject'

  get 'advisors/validate/:id', to: 'advisors#validate', as: 'advisors_validate'
  post 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
  post 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'

  post 'advices/create', to: 'advices#create', as: 'advice_create'
  get 'advices', to: 'advices#index', as: 'advices'
  get 'advices/new', to: 'advices#new', as: 'new_advice'
  get 'advices/show', to: 'advices#show',as: ''

  root 'welcome#index'
  devise_for :users
  
  resources :environments
  resources :semesters
  resources :subjects
  resources :undergraduates
  resources :students
  resources :classrooms
  resources :sessions, only: [:index, :new, :create]
 
  resources :advisors do
    resource :schedule, only: [:show, :new, :create]
    resource :grade, only: [:show, :update]
  end

  post 'advisors/:advisor_id/grade', to: 'grades#update', as: 'advisor_grade'
  get 'advisors/ranking', to: 'advisors#ranking', as: 'ranking_advisor'

  resources :surveys

  resources :applications, only: :index
  namespace :applications do
    resources :students, only: [:index, :show]
    post 'students/accept/:id', to: 'students#accept', as: 'student_accept'
    post 'students/reject/:id', to: 'students#reject', as: 'student_reject'

    resources :advisors, only: [:index, :show]
    post 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    post 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'
  end

  resources :downloads, only: :index
  namespace :downloads do
    get :students
  end
end
