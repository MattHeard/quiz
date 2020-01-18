require_relative '../../app/models/quiz'

describe Quiz do
  context 'when no questions have been answered' do
    it 'is not complete' do
      quiz = Quiz.new
      expect(quiz).to_not be_complete
    end

    it 'has a first question' do
      quiz = Quiz.new
      expected_question = 'Which of the following capital cities is closest to the North Pole?'
      expect(quiz.first_question).to eq expected_question
    end

    it 'has five options for answering the first question' do
      quiz = Quiz.new
      expected_options = [
        'Managua',
        'Canberra',
        'Amsterdam',
        'Nicosia',
        'Mogadishu'
      ]
      expect(quiz.first_options).to eq expected_options
    end

    it 'has 0 answered questions' do
      quiz = Quiz.new
      expect(quiz.answer_count).to eq 0
    end
  end

  context 'when answering the first question' do
    it 'is not complete' do
      quiz = Quiz.new
      quiz.answer(quiz.first_question, 'Amsterdam')
      expect(quiz).to_not be_complete
    end

    it 'has 1 answered question' do
      quiz = Quiz.new
      quiz.answer(quiz.first_question, 'Amsterdam')
      expect(quiz.answer_count).to eq 1
    end
  end
end
