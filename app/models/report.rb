class Report
  def initialize(quizzes)
    @quizzes = quizzes
  end

  def total_choices(question:, option:)
    @quizzes.count { |quiz| quiz.choice(question) == option }
  end
end
