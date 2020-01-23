require 'byebug'

class QuizzesController < ApplicationController
  def update
    latest_choice_index = params['option']
    id = session[:quiz_id]
    repository = QuizRepository.new
    if id
      record = QuizRecord.find(session[:quiz_id])
      unanswered_question_key = %i[q0 q1 q2 q3 q4].find { |k| !record[k] }
      if unanswered_question_key
        record.update!(unanswered_question_key => latest_choice_index)
      end
    else
      quiz = Quiz.new
      question = quiz.next_question
      choice = question.option(latest_choice_index.to_i)
      quiz.answer(choice)
      id = repository.create!(quiz)
      session[:quiz_id] = id
    end
    quiz = repository.find_by_id(id)
    redirect_to (quiz.complete? ? '/review' : '/quiz')
  end

  def edit
    id = session[:quiz_id]
    record = QuizRecord.find(id) if id
    repository = QuizRepository.new
    quiz = repository.find_by_id(id)
    if quiz.answer_count > 0
      question = quiz.previous_question
      choice = quiz.choice(question)
      @correct = (choice == question.correct_answer)
      @correct_answer = question.correct_answer
    end
    if quiz.complete?
      redirect_to '/review'
    end
    @answer_count = quiz.answer_count
    title_prefixes = {
      0 => 'First',
      1 => 'Second',
      2 => 'Third',
      3 => 'Fourth',
      4 => 'Last'
    }
    @title = "#{title_prefixes[@answer_count]} question"
    @question = quiz.next_question
  end
end
