# frozen_string_literal: true

class Question
  attr_reader :correct_answer, :options

  def initialize(text:, options:, correct_answer:)
    @text = text
    @options = options
    @correct_answer = correct_answer
  end

  def to_s
    @text
  end

  def option(i)
    @options[i]
  end
end
