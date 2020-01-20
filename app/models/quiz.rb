require_relative 'question'

class Quiz
  # TODO(matt) Finish defining questions
  # TODO(matt) Move the questions into a config file
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
    ),
    Question.new(
      text: '',
      options: []
    ),
    Question.new(
      text: '',
      options: []
    )
  ].freeze

  def initialize
    @answers = Hash.new
  end

  def complete?
    answer_count > 4
  end

  def next_question
    QUESTIONS[answer_count]
  end

  def answer_count
    QUESTIONS.count { |question| @answers[question] }
  end

  def answer(question, option)
    @answers[question] = option
  end

  def choice(question)
    @answers[question]
  end

  def score
    0
  end
end
