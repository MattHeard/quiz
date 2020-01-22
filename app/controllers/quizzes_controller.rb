class QuizzesController < ApplicationController
  def update
    quiz = Quiz.new
    latest_choice_index = params['option']
    if session[:quiz_id]
      record = QuizRecord.find(session[:quiz_id])
      puts record.inspect
      if record.q0
        choice_index = record.q0.to_i
        question = quiz.next_question
        choice = question.option(choice_index)
        quiz.answer(choice)
        unless record.q1
          record.update!(q1: latest_choice_index)
        end
      end
    else
      record = QuizRecord.create!(q0: latest_choice_index)
      session[:quiz_id] = record.id
    end
    redirect_to '/quiz'
  end

  def edit
    quiz_id = session[:quiz_id]
    record = QuizRecord.find(quiz_id) if quiz_id
    quiz = Quiz.new
    if record&.q0
      choice_index = record.q0.to_i
      question = quiz.next_question
      choice = question.option(choice_index)
      quiz.answer(choice)
      @correct = (choice == question.correct_answer)
      @correct_answer = question.correct_answer
    end
    if record&.q1
      choice_index = record.q1.to_i
      question = quiz.next_question
      choice = question.option(choice_index)
      quiz.answer(choice)
      @correct = (choice == question.correct_answer)
      @correct_answer = question.correct_answer
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
