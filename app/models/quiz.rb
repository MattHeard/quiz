require_relative 'question'

class Quiz
  QUESTIONS = [
    Question.new(
      text: 'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez',
      options: ['Hours', 'Days', 'Months', 'Years', 'Centuries']
    ),
    Question.new(
      text: 'Which Brontë sister wrote Jane Eyre?',
      options: ['Elizabeth', 'Charlotte', 'Emily', 'Anne']
    ),
    Question.new(
      text: 'How old was Mary Shelley when she wrote Frankenstein?',
      options: ['Eighteen', 'Twenty-one', 'Thirty-five']
    )
  ].freeze

  def initialize
    @answer_count = 0
  end

  def complete?
    @answer_count > 4
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
