class Quiz
  def initialize
    @first_question = Question.new(
      text: 'Which of the following capital cities is closest to the North Pole?',
      options: ['Managua', 'Canberra', 'Amsterdam', 'Nicosia', 'Mogadishu']
    )
  end

  def complete?
    false
  end

  class Question
    def initialize(text:, options:)
      @text = text
      @options = options
    end

    def to_s
      @text
    end

    def options
      @options
    end
  end

  def first_question
    @first_question.to_s
  end

  def first_options
    @first_question.options
  end
end