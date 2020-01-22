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
    expect(response.body).to include('Fourth question')
    expect(response.body).to include('In Lord of the Flies, the first child Ralph encounters is _____.')
    expect(response.body).to include('Piggy')
    post '/quiz', params: { option: "2" }
    expect(session[:quiz_id]).to_not be_nil
    get '/quiz'
    expect(response.body).to include("Correct! It was 'Piggy'")
    expect(response.body).to include('Last question')
    expect(response.body).to include('In Great Expectations, does Miss Havisham die from her dress catching on fire?')
    expect(response.body).to include('No')
    post '/quiz', params: { option: "1" }
    expect(session[:quiz_id]).to_not be_nil
    get '/review'
    expect(response.body).to include("Sorry! It was 'Yes'")
    expect(response.body).to include('How do you compare?')
    expect(response.body).to include('Your answer')
  end
end
