# frozen_string_literal: true

require 'rails_helper'

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

    it 'has no previous question' do
      expect(quiz.previous_question).to be_nil
    end

    it 'has five options for answering the first question' do
      expected_options = %w[Hours Days Months Years Centuries]
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
      quiz.answer(anything)
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

    it 'sets the previous question to be the first question' do
      expected_question =
        'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez'
      expect(quiz.previous_question.to_s).to eq expected_question
    end

    it 'has five options for answering the second question' do
      expected_options = %w[Elizabeth Charlotte Emily Anne Branwell]
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the first question incorrectly' do
    it 'has a score of 0' do
      first_question = quiz.next_question
      correct_answer = first_question.option(3)
      incorrect_answer = first_question.option(0)
      quiz.answer(incorrect_answer)
      expect(quiz.score).to eq 0
    end
  end

  context 'after answering the first question correctly' do
    it 'has a score of 1' do
      first_question = quiz.next_question
      correct_answer = first_question.option(3)
      quiz.answer(correct_answer)
      expect(quiz.score).to eq 1
    end
  end

  context 'after answering the second question' do
    before do
      2.times { quiz.answer(anything) }
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

    it 'sets the previous question to be the second question' do
      expected_question = 'Which Brontë sister wrote Jane Eyre?'
      expect(quiz.previous_question.to_s).to eq expected_question
    end

    it 'has four options for answering the third question' do
      expected_options = %w[Eighteen Twenty-one Thirty-five Fifty-four]
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the first two questions correctly' do
    it 'has a score of 2' do
      first_question = quiz.next_question
      correct_first_question_answer = first_question.option(3)
      quiz.answer(correct_first_question_answer)
      second_question = quiz.next_question
      correct_second_question_answer = second_question.option(1)
      quiz.answer(correct_second_question_answer)
      expect(quiz.score).to eq 2
    end
  end

  context 'after answering the third question' do
    before do
      3.times { quiz.answer(anything) }
    end

    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'has 3 answered questions' do
      expect(quiz.answer_count).to eq 3
    end

    it 'sets the next question to be the fourth question' do
      expected_question = 'In Lord of the Flies, the first child Ralph encounters is _____.'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'sets the previous question to be the third question' do
      expected_question = 'How old was Mary Shelley when she wrote Frankenstein?'
      expect(quiz.previous_question.to_s).to eq expected_question
    end

    it 'has three options for answering the fourth question' do
      expected_options = %w[Jack Simon Piggy]
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the fourth question' do
    before do
      4.times { quiz.answer(anything) }
    end

    it 'is not complete' do
      expect(quiz).to_not be_complete
    end

    it 'has 4 answered questions' do
      expect(quiz.answer_count).to eq 4
    end

    it 'sets the next question to be the fifth and last question' do
      expected_question = 'In Great Expectations, does Miss Havisham die from her dress catching on fire?'
      expect(quiz.next_question.to_s).to eq expected_question
    end

    it 'sets the previous question to be the fourth question' do
      expected_question = 'In Lord of the Flies, the first child Ralph encounters is _____.'
      expect(quiz.previous_question.to_s).to eq expected_question
    end

    it 'has two options for answering the fifth and last question' do
      expected_options = %w[Yes No]
      expect(quiz.next_question.options).to eq expected_options
    end
  end

  context 'after answering the fifth question' do
    before do
      5.times { quiz.answer(anything) }
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
      quiz.answer(first_option)
      expect(quiz.choice(first_question)).to eq first_option
    end
  end
end
