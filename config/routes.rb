Rails.application.routes.draw do
#  get 'advisors/accept'
#  get 'advisors/reject'
  get 'students/validate/:id', to: 'students#validate', as: 'students_validate'
  post 'students/accept/:id', to: 'students#accept', as: 'students_accept'
  post 'students/reject/:id', to: 'students#reject', as: 'students_reject'
  get 'advisors/validate/:id', to: 'advisors#validate', as: 'advisors_validate'
  post 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
  post 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'


  root 'welcome#index'

  resources :semesters
  resources :subjects
  resources :undergraduates

  resources :students

  resources :sessions, only: [:index, :new, :create]

  resources :advisors do
    resource :schedule, only: [:show, :new, :create]
  end

  
  resources :advices

end
