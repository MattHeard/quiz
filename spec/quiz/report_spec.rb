require_relative '../../app/models/quiz'

class Report
  def initialize(quizzes)
    @quizzes = quizzes
  end

  def total_choices(question:, option:)
    @quizzes.count { |quiz| quiz.choice(question) == option }
  end
end

describe Report do
  context 'when there are no quiz responses' do
    it 'shows 0 choices of the first option for the first question' do
      report = Report.new([])
      expect(report.total_choices(question: 1, option: 1)).to eq 0
    end
  end

  context 'when there is 1 quiz response selecting the first option for the first question' do
    it 'shows 0 choices of the first option for the first question' do
      quiz = Quiz.new
      first_question = quiz.next_question
      first_option = first_question.first_option
      quiz.answer(first_question, first_option)
      report = Report.new([quiz])
      expect(report.total_choices(question: first_question, option: first_option)).to eq 1
    end
  end
end
