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

    it 'has a score of 0' do
      expect(quiz.score).to eq 0
    end
  end

  context 'after answering the first question' do
    before do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
    end

    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'has 1 answered question' do
      expect(quiz.answer_count).to eq 1
    end

    it 'sets the next question to be the second question' do
      expected_question = 'Which Brontë sister wrote Jane Eyre?'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has four options for answering the second question' do
      expected_options = ['Elizabeth', 'Charlotte', 'Emily', 'Anne']
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the first question incorrectly' do
    it 'has a score of 0' do
      first_question = quiz.next_question
      correct_answer = first_question.option(3)
      incorrect_answer = first_question.option(0)
      quiz.answer(first_question, incorrect_answer)
      expect(quiz.score).to eq 0
    end
  end

  context 'after answering the first question correctly' do
    it 'has a score of 1' do
      first_question = quiz.next_question
      correct_answer = first_question.option(3)
      quiz.answer(first_question, correct_answer)
      expect(quiz.score).to eq 1
    end
  end

  context 'after answering the second question' do
    before do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
    end

    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'has 2 answered questions' do
      expect(quiz.answer_count).to eq 2
    end

    it 'sets the next question to be the third question' do
      expected_question = 'How old was Mary Shelley when she wrote Frankenstein?'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'has three options for answering the third question' do
      expected_options = ['Eighteen', 'Twenty-one', 'Thirty-five']
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the third question' do
    before do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      third_question = quiz.next_question
      quiz.answer(third_question, anything)
    end

    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'has 3 answered questions' do
      expect(quiz.answer_count).to eq 3
    end
  end

  context 'after answering the fourth question' do
    before do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      third_question = quiz.next_question
      quiz.answer(third_question, anything)
      fourth_question = quiz.next_question
      quiz.answer(fourth_question, anything)
    end

    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'has 4 answered questions' do
      expect(quiz.answer_count).to eq 4
    end
  end

  context 'after answering the fifth question' do
    before do
      first_question = quiz.next_question
      quiz.answer(first_question, anything)
      second_question = quiz.next_question
      quiz.answer(second_question, anything)
      third_question = quiz.next_question
      quiz.answer(third_question, anything)
      fourth_question = quiz.next_question
      quiz.answer(fourth_question, anything)
      fifth_question = quiz.next_question
      quiz.answer(fifth_question, anything)
    end

    it 'is complete' do
      expect(quiz).to be_complete
    end

    it 'has 5 answered questions' do
      expect(quiz.answer_count).to eq 5
    end
  end

  context 'when the first option of the first question is chosen' do
    it 'identifies the first option as chosen' do
      first_question = quiz.next_question
      first_option = first_question.option(0)
      quiz.answer(first_question, first_option)
      expect(quiz.choice(first_question)).to eq first_option
    end
  end
end
