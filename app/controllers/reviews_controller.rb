class ReviewsController < ApplicationController
  def show
    quiz_id = session[:quiz_id]
    record = QuizRecord.find(quiz_id) if quiz_id
    quiz = Quiz.new
    %i[q0 q1 q2 q3 q4].each do |answer_key|
      if record[answer_key]
        choice_index = record[answer_key].to_i
        question = quiz.next_question
        choice = question.option(choice_index)
        quiz.answer(choice)
        @correct = (choice == question.correct_answer)
        @correct_answer = question.correct_answer
      end
    end

    all_quiz_records = QuizRecord.where.not(q4: nil).all
    all_quizzes = all_quiz_records.map do |other_record|
      other_quiz = Quiz.new
      %i[q0 q1 q2 q3 q4].each do |answer_key|
        choice_index = other_record[answer_key].to_i
        question = other_quiz.next_question
        choice = question.option(choice_index)
        other_quiz.answer(choice)
      end
      other_quiz
    end
    @report = Report.new(all_quizzes)
    puts @report.inspect

    redirect_to '/quiz' unless quiz.complete?
  end
end
