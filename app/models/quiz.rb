class Quiz
  def complete?
    false
  end

  class Question; end

  def first_question
    'Which of the following capital cities is closest to the North Pole?'
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
