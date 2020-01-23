# frozen_string_literal: true

require_relative 'question'

class Quiz
  # TODO(matt) Move the questions into a config file
  QUESTIONS = [
    Question.new(
      text: 'Fill in the blank: One Hundred ____ of Solitude by Gabriel García Márquez',
      options: %w[Hours Days Months Years Centuries],
      correct_answer: 'Years'
    ),
    Question.new(
      text: 'Which Brontë sister wrote Jane Eyre?',
      options: %w[Elizabeth Charlotte Emily Anne Branwell],
      correct_answer: 'Charlotte'
    ),
    Question.new(
      text: 'How old was Mary Shelley when she wrote Frankenstein?',
      options: %w[Eighteen Twenty-one Thirty-five Fifty-four],
      correct_answer: 'Eighteen'
    ),
    Question.new(
      text: 'In Lord of the Flies, the first child Ralph encounters is _____.',
      options: %w[Jack Simon Piggy],
      correct_answer: 'Piggy'
    ),
    Question.new(
      text: 'In Great Expectations, does Miss Havisham die from her dress catching on fire?',
      options: %w[Yes No],
      correct_answer: 'Yes'
    )
  ].freeze

  def initialize
    @answers = {}
  end

  def complete?
    answer_count > 4
  end

  def next_question
    QUESTIONS[answer_count]
  end

  def previous_question
    QUESTIONS[answer_count - 1] if answer_count > 0
  end

  def answer_count
    QUESTIONS.count { |question| @answers[question] }
  end

  def answer(option)
    @answers[next_question] = option
  end

  def choice(question)
    @answers[question]
  end

  def score
    QUESTIONS.count { |question| @answers[question] == question.correct_answer }
  end
end
