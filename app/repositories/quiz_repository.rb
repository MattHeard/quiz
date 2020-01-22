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
end
