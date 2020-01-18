require_relative 'question'

class Quiz
  QUESTIONS = [
    Question.new(
      text: 'Which of the following capital cities is closest to the North Pole?',
      options: ['Managua', 'Canberra', 'Amsterdam', 'Nicosia', 'Mogadishu']
    ),
    Question.new(
      text: 'Which of the following capital cities is closest to the Prime Meridian?',
      options: ['Kigalil', 'San Marino', 'Hamilton', 'Yaounde']
    )
  ].freeze

  def initialize
    @answer_count = 0
  end

  def complete?
    false
  end

  def first_question
    QUESTIONS.first.to_s
  end

  def second_question
    QUESTIONS[1].to_s
  end

  def next_question
    first_question
  end

  def first_options
    QUESTIONS.first.options
  end

  def answer_count
    @answer_count
  end

  def answer(question, option)
    @answer_count += 1
  end
end
