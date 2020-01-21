class QuizzesController < ApplicationController
  def new
    quiz = Quiz.new
    @question = quiz.next_question
  end
end
