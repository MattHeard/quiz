class ReviewsController < ApplicationController
  def show
    quiz_id = session[:quiz_id]
    repository = QuizRepository.new
    @quiz = repository.find_by_id(quiz_id)
    if @quiz.complete?
      question = @quiz.previous_question
      choice = @quiz.choice(question)
      @correct = (choice == question.correct_answer)
      @correct_answer = question.correct_answer

      all_quizzes = repository.all_complete_quizzes
      @report = Report.new(all_quizzes)
    else
      redirect_to '/quiz'
    end
  end
end
