class Report
  def initialize(quizzes)
    @quizzes = quizzes
  end

  def choice_count(question:, option:)
    @quizzes.count { |quiz| quiz.choice(question) == option }
  end

  def choice_share(question:, option:)
    count = choice_count(question: question, option: option).to_f
    count / @quizzes.size
  end
end
