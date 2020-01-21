class QuizzesController < ApplicationController
  def create
    quiz = Quiz.new
    first_question = quiz.next_question
    choice_index = params['option']
    record = QuizRecord.create(q1: choice_index)
    session[:quiz_id] = record.id
    redirect_to '/quiz'
  end

  def edit
    quiz_id = session[:quiz_id]
    record = QuizRecord.find(quiz_id) if quiz_id
    quiz = Quiz.new
    if record&.q1
      choice_index = record.q1.to_i
      question = quiz.next_question
      choice = question.option(choice_index)
      quiz.answer(choice)
      @correct = (choice == question.correct_answer)
      @correct_answer = question.correct_answer
    end
    @question = quiz.next_question
  end
end
