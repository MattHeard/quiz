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

  context 'after answering the first question' do
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
      expected_question = 'Which Brontë sister wrote Jane Eyre?'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has four options for answering the second question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      expected_options = ['Elizabeth', 'Charlotte', 'Emily', 'Anne']
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the second question' do
    let(:any_answer) { 'Ummm' }

    it 'is not complete' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      second_question = quiz.next_question
      quiz.answer(second_question, any_answer)
      expect(quiz).to_not be_complete
    end

    it 'has 2 answered questions' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      second_question = quiz.next_question
      quiz.answer(second_question, any_answer)
      expect(quiz.answer_count).to eq 2
    end

    it 'sets the next question to be the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      quiz.answer(first_question, any_answer)
      second_question = quiz.next_question
      quiz.answer(second_question, any_answer)
      expected_question = 'How old was Mary Shelley when she wrote Frankenstein?'
      expect(quiz.next_question.to_s).to eq expected_question
    end
  end
end
