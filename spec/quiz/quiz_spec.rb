require_relative '../../app/models/quiz'

describe Quiz do
  context 'when no questions have been answered' do
    it 'is not complete' do
      quiz = Quiz.new
      expect(quiz).to_not be_complete
    end

    it 'sets the next question to be the first question' do
      quiz = Quiz.new
      expected_question =
        'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has five options for answering the first question' do
      quiz = Quiz.new
      expected_options = ['Hours', 'Days', 'Months', 'Years', 'Centuries']
      expect(quiz.next_question.options).to eq expected_options
    end

    it 'has 0 answered questions' do
      quiz = Quiz.new
      expect(quiz.answer_count).to eq 0
    end
  end

  context 'when answering the first question' do
    let(:any_answer) { 'Years' }

    it 'is not complete' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      expect(quiz).to_not be_complete
    end

    it 'has 1 answered question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      expect(quiz.answer_count).to eq 1
    end

    it 'sets the next question to be the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      expected_question =
        'Which of the following capital cities is closest to the Prime Meridian?'
      expect(quiz.next_question.to_s).to eq expected_question
    end
  end
end
