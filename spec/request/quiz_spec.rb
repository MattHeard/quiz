require 'rails_helper'

RSpec.describe 'answering a quiz', type: :request do
  it 'has five questions and a report of all quizzes' do
    get '/'
    expect(response.body).to include('Start')
    get '/quiz'
    expect(response.body).to include('First question')
    expect(response.body).to include('Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez')
    expect(response.body).to include('Years')
    post '/quiz', params: { option: "3" }
    expect(session[:quiz_id]).to_not be_nil
    get '/quiz'
    expect(response.body).to include("Correct! It was 'Years'")
    expect(response.body).to include('Second question')
    expect(response.body).to include('Which Brontë sister wrote Jane Eyre?')
    expect(response.body).to include('Charlotte')
    post '/quiz', params: { option: "1" }
    expect(session[:quiz_id]).to_not be_nil
    get '/quiz'
    expect(response.body).to include("Correct! It was 'Charlotte'")
    expect(response.body).to include('Third question')
    expect(response.body).to include('How old was Mary Shelley when she wrote Frankenstein?')
    expect(response.body).to include('Eighteen')
    post '/quiz', params: { option: "0" }
    expect(session[:quiz_id]).to_not be_nil
    get '/quiz'
    expect(response.body).to include("Correct! It was 'Eighteen'")
  end
end
