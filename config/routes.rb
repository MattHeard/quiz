Rails.application.routes.draw do
  root to: 'index#main'

  get 'quiz', action: :edit, controller: 'quizzes'

  resource :quiz, only: %i[create]
end
