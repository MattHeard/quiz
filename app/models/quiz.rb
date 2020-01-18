class Quiz
  def complete?
    false
  end

  class Question
    def initialize(text)
      @text = text
    end

    def to_s
      @text
    end
  end

  def first_question
    question = Question.new('Which of the following capital cities is closest to the North Pole?')
    question.to_s
  end

  def first_options
    [
      'Managua',
      'Canberra',
      'Amsterdam',
      'Nicosia',
      'Mogadishu'
    ]
  end
end
