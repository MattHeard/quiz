require_relative '../../app/models/quiz'

describe Quiz do
  subject(:quiz) { Quiz.new }

  context 'when no questions have been answered' do
    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'sets the next question to be the first question' do
      expected_question =
        'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has five options for answering the first question' do
      expected_options = ['Hours', 'Days', 'Months', 'Years', 'Centuries']
      expect(quiz.next_question.options).to eq expected_options
    end

    it 'has 0 answered questions' do
      expect(quiz.answer_count).to eq 0
    end
  end

  context 'after answering the first question' do
    it 'is not complete' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      expect(quiz).to_not be_complete
    end

    it 'has 1 answered question' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      expect(quiz.answer_count).to eq 1
    end

    it 'sets the next question to be the second question' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      expected_question = 'Which Brontë sister wrote Jane Eyre?'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has four options for answering the second question' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      expected_options = ['Elizabeth', 'Charlotte', 'Emily', 'Anne']
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the second question' do
    it 'is not complete' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      expect(quiz).to_not be_complete
    end

    it 'has 2 answered questions' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      expect(quiz.answer_count).to eq 2
    end

    it 'sets the next question to be the third question' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      expected_question = 'How old was Mary Shelley when she wrote Frankenstein?'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has three options for answering the third question' do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      expected_options = ['Eighteen', 'Twenty-one', 'Thirty-five']
      expect(quiz.next_question.options).to eq expected_options
    end
  end
end
