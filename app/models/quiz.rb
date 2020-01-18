require_relative 'question'

class Quiz
  QUESTIONS = [
    Question.new(
      text: 'Which of the following capital cities is closest to the North Pole?',
      options: ['Managua', 'Canberra', 'Amsterdam', 'Nicosia', 'Mogadishu']
    )
  ].freeze

  def complete?
    false
  end

  def first_question
    QUESTIONS.first.to_s
  end

  def first_options
    QUESTIONS.first.options
  end

  def answer_count
    0
  end

  def answer(question, option)
  end
end
