class QuizzesController < ApplicationController
  def create
    quiz = Quiz.new
    first_question = quiz.next_question
    choice_index = params['option'].to_i
    choice = first_question.option(choice_index)
    puts choice
  end

  def new
    quiz = Quiz.new
    @question = quiz.next_question
  end
end
