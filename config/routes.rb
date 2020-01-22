Rails.application.routes.draw do
  root to: 'index#main'

  get 'quiz', action: :edit, controller: 'quizzes'
  post 'quiz', action: :update, controller: 'quizzes'
  get 'review', action: :show, controller: 'reviews'
end
