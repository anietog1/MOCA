Rails.application.routes.draw do
  get 'sessions/edit'
  get 'sessions/index/:id', to: 'sessions#index', as: 'sessions_index'
  get 'sessions/create/:id', to: 'sessions#create',  as: 'sessions_create'
  get 'sessions/show_creating/:id', to: 'sessions#show_creating', as: 'sessions_show'
  root 'welcome#index'
  resources :advisors do
    resources :advisor_has_sessions
  end
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
