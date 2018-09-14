Rails.application.routes.draw do
  resources :applications, only: [:index]

  namespace :applications do
    resources :advisors, only: [:index, :show]
    get 'advisors/accept/:id', to: 'advisors#accept', as: 'advisor_accept'
    get 'advisors/reject/:id', to: 'advisors#reject', as: 'advisor_reject'
  end
end
