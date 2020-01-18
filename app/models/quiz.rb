require_relative 'question'

class Quiz
  QUESTIONS = [
    Question.new(
      text: 'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez',
      options: ['Hours', 'Days', 'Months', 'Years', 'Centuries']
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

  def next_question
    QUESTIONS[answer_count]
  end

  def answer_count
    @answer_count
  end

  def answer(question, option)
    @answer_count += 1
  end
end
