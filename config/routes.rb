Rails.application.routes.draw do
  post 'advisors/:advisor_id/grade', to: 'grades#update', as: 'advisor_grade'
  get 'advisors/ranking', to: 'advisors#ranking', as: 'ranking_advisor'

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

  
  scope '/(:locale)', defaults: { locale: 'es' }, constraints: { locale: /es|en/ } do

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


   resources :surveys


   resources :downloads, only: :index
   namespace :downloads do
     get :students
   end
   get '/', to: 'welcome#index'
   root 'welcome#index'
 end
end
