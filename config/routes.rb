Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
    
  # resources :technical_questions
  # resources :non_technical_questions

    get 'technical_questions' => 'question/technical_questions#index'
    get 'my_technical_questions' => 'question/technical_questions#user_technical_questions'
    get 'technical_new' => 'question/technical_questions#technical_new'
    post 'technical_create' => 'question/technical_questions#technical_create'
    get 'technical_questions' => 'question/technical_questions#technical_question'
    
    get 'non_technical_questions' => 'question/non_technical_questions#index'
    get 'my_non_technical_questions' => 'question/non_technical_questions#user_non_technical_questions'
    get 'non_technical_new' => 'question/non_technical_questions#non_technical_new'
    post 'non_technical_create' => 'question/non_technical_questions#non_technical_create'
    get 'non_technical_questions' => 'question/non_technical_questions#non_technical_question'

    get 'about' => 'welcome#about'

  resources :answers

  resources :articles
  
end
