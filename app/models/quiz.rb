require_relative 'question'

class Quiz
  # TODO(matt) Finish defining questions
  # TODO(matt) Move the questions into a config file
  QUESTIONS = [
    Question.new(
      text: 'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez',
      options: ['Hours', 'Days', 'Months', 'Years', 'Centuries'],
      correct_answer: 'Years'
    ),
    Question.new(
      text: 'Which Brontë sister wrote Jane Eyre?',
      options: ['Elizabeth', 'Charlotte', 'Emily', 'Anne'],
      correct_answer: 'Charlotte'
    ),
    Question.new(
      text: 'How old was Mary Shelley when she wrote Frankenstein?',
      options: ['Eighteen', 'Twenty-one', 'Thirty-five'],
      correct_answer: 'Eighteen'
    ),
    Question.new(
      text: '',
      options: [],
      correct_answer: ''
    ),
    Question.new(
      text: '',
      options: [],
      correct_answer: ''
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
    (@answers[QUESTIONS.first] == QUESTIONS.first.correct_answer) ? 1 : 0
  end
end
