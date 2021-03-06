Rails.application.routes.draw do
  get 'sessions/show'
  delete 'advices/destroy/:id', to: 'advices#destroy', as: 'advice_cancel'

  post 'attendance_take', to: 'sessions#take_attendance', as: 'take_attendance'
  scope '/(:locale)', defaults: { locale: 'es' }, constraints: { locale: /es|en/ } do  
    # Main page
    get '/', to: 'welcome#index'
    root 'welcome#index'
    get 'welcome/admin'
    get 'welcome/super_admin'

    # Routes for statistics' graphics
    get 'statistics_for_advices', to: 'statistics_for_advices#index', as: 'advices_statistics'
  
    post 'students/:student_id/survey', to: 'surveys#create', as: 'student_survey'
    post 'students/:student_id/survey', to: 'surveys#create', as: 'create_survey'
     
    post 'advisors/:advisor_id/grade', to: 'grades#update', as: 'advisor_grade'
    get 'advisors/ranking', to: 'advisors#ranking', as: 'ranking_advisor'
  
    get 'students/validate/:id', to: 'students#validate', as: 'students_validate'
    post 'students/accept/:id', to: 'students#accept', as: 'students_accept'
    post 'students/reject/:id', to: 'students#reject', as: 'students_reject'
  
    get 'advisors/validate/:id', to: 'advisors#validate', as: 'advisors_validate'
    post 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    post 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'

    devise_for :users
    resources :surveys
    resources :environments
    resources :semesters
    resources :subjects
    resources :undergraduates
    resources :students
    resources :classrooms
    
    resources :students do
      resource :survey, only: [:index, :show, :create]  
    end

    resources :advisors do
      resource :schedule, only: [:show, :new, :create]
      resource :grade, only: [:show, :update]
    end

    resources :advices, only: [:index, :new]
    post 'advices', to: 'advices#create', as: 'advice_create'

    resources :downloads, only: :index
    namespace :downloads do
      get :students
    end
  end
end
