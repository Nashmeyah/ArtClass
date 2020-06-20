Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to:  'devise/registrations#new'
  end

  root to: 'application#welcome'

  


  resources :userscourses, only: [:index, :show, :destroy] do 
    resources :projects, only: [:new, :show]
  end

  resources :projects

  post '/userscourses/:id/projects/new', to: "projects#create", as: "new_course_project"

  post '/categories/:category_id/courses/:id', to: "userscourses#create", as: "new_usercourse"




  resources :categories do
    resources :courses, only: [:show, :index, :new]  
  end

end
