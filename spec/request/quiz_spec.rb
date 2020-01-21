require 'rails_helper'

RSpec.describe 'answering a quiz', type: :request do
  it 'has five questions and a report of all quizzes' do
    get '/'
    get '/quiz/new'
  end
end
