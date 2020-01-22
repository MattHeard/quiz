class QuizzesController < ApplicationController
  def update
    latest_choice_index = params['option']
    if session[:quiz_id]
      record = QuizRecord.find(session[:quiz_id])
      unanswered_question_key = %i[q0 q1 q2 q3 q4].find { |k| !record[k] }
      if unanswered_question_key
        record.update!(unanswered_question_key => latest_choice_index)
      end
    else
      record = QuizRecord.create!(q0: latest_choice_index)
      session[:quiz_id] = record.id
    end
    redirect_to (record.q4 ? '/review' : '/quiz')
  end

  def edit
    quiz_id = session[:quiz_id]
    record = QuizRecord.find(quiz_id) if quiz_id
    repository = QuizRepository.new
    quiz = repository.find_by_id(quiz_id)
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
