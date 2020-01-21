Rails.application.routes.draw do
  root to: 'index#main'

  resource :quiz, only: %i[create new]
end
