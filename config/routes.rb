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

end
