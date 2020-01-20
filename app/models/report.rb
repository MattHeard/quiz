class Report
  def initialize(quizzes)
    @quizzes = quizzes
  end

  def total_choices(question:, option:)
    @quizzes.count { |quiz| quiz.choice(question) == option }
  end

  def choice_share(question:, option:)
    1
  end
end
