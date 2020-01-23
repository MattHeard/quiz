# frozen_string_literal: true

require 'yaml'

require_relative 'question'

class Quiz
  QUESTION_CONFIG = YAML.load(File.read(Rails.root.join('config', 'quiz.yml')))
  QUESTIONS = QUESTION_CONFIG.map do |q|
    Question.new(text: q['text'],
                 options: q['options'],
                 correct_answer: q['correct_answer'])
  end.freeze

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
