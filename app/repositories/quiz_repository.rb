class QuizRepository
  def find_by_id(quiz_id)
    record = QuizRecord.find(quiz_id) if quiz_id
    quiz = Quiz.new
    if record
      %i[q0 q1 q2 q3 q4].each do |answer_key|
        if record[answer_key]
          choice_index = record[answer_key].to_i
          question = quiz.next_question
          choice = question.option(choice_index)
          quiz.answer(choice)
        end
      end
    end

    quiz
  end

  def all_complete_quizzes
    all_quiz_records = QuizRecord.where.not(q4: nil).all
    all_quiz_records.map do |other_record|
      other_quiz = Quiz.new
      %i[q0 q1 q2 q3 q4].each do |answer_key|
        choice_index = other_record[answer_key].to_i
        question = other_quiz.next_question
        choice = question.option(choice_index)
        other_quiz.answer(choice)
      end
      other_quiz
    end
  end

  def create!(quiz)
    question = Quiz::QUESTIONS.first
    choice = quiz.choice(question)
    choice_index = question.options.index(choice)
    record = QuizRecord.create!(q0: choice_index)
    record.id
  end

  def update!(quiz_id, quiz)
    record = QuizRecord.find(quiz_id)
    previous_question = quiz.previous_question
    question_index = Quiz::QUESTIONS.index(previous_question)
    question_key = "q#{question_index}"
    choice = quiz.choice(previous_question)
    choice_index = previous_question.options.index(choice)
    record.update!(question_key => choice_index)
  end
end
