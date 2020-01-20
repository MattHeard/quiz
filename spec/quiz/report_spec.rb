require_relative '../../app/models/quiz'
require_relative '../../app/models/report'

describe Report do
  context 'when there are no quiz responses' do
    it 'shows 0 choices of the first option for the first question' do
      report = Report.new([])
      expect(report.choice_count(question: 1, option: 1)).to eq 0
    end
  end

  context 'when there is 1 quiz response selecting the first option for the first question' do
    it 'shows 1 choice of the first option for the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      first_option = first_question.first_option
      quiz.answer(first_question, first_option)
      report = Report.new([quiz])
      expect(report.choice_count(question: first_question, option: first_option)).to eq 1
    end
  end

  context 'when there is 1 quiz response selecting the first option for the first question' do
    it 'shows 100% of choices for the first option for the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      first_option = first_question.first_option
      quiz.answer(first_question, first_option)
      report = Report.new([quiz])
      expect(report.choice_share(question: first_question, option: first_option)).to eq 1
    end
  end

  context 'when there is 1 quiz response selecting the second option for the first question' do
    it 'shows 0 choices of the first option for the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      second_option = first_question.second_option
      quiz.answer(first_question, second_option)
      report = Report.new([quiz])
      first_option = first_question.first_option
      expect(report.choice_count(question: first_question, option: first_option)).to eq 0
    end
  end

  context 'when there is 1 quiz response selecting the second option for the first question' do
    it 'shows 0% of choices for the first option for the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      second_option = first_question.second_option
      quiz.answer(first_question, second_option)
      report = Report.new([quiz])
      first_option = first_question.first_option
      expect(report.choice_share(question: first_question, option: first_option)).to eq 0
    end
  end

  context 'when there are 2 quiz responses selecting the first option for the first question' do
    it 'shows 2 choice of the first option for the first question' do
      first_quiz = Quiz.new
      first_question = first_quiz.next_question
      first_option = first_question.first_option
      first_quiz.answer(first_question, first_option)
      second_quiz = Quiz.new
      second_quiz.answer(first_question, first_option)
      report = Report.new([first_quiz, second_quiz])
      expect(report.choice_count(question: first_question, option: first_option)).to eq 2
    end
  end

  context 'when there are 2 quiz responses for the first two options for the first question' do
    it 'shows 50% of choices for the first option for the first question' do
      first_quiz = Quiz.new
      first_question = first_quiz.next_question
      first_option = first_question.first_option
      first_quiz.answer(first_question, first_option)
      second_quiz = Quiz.new
      second_option = first_question.second_option
      second_quiz.answer(first_question, second_option)
      report = Report.new([first_quiz, second_quiz])
      expect(report.choice_share(question: first_question, option: first_option))
        .to be_within(0.01)
        .of 0.5
    end
  end
end
