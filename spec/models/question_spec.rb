# frozen_string_literal: true

require_relative '../../app/models/question'

describe Question do
  context 'when the options are "True" and "False"' do
    it 'has "True" as the first option' do
      question = Question.new(text: anything, options: %w[True False], correct_answer: 'True')
      expect(question.option(0)).to eq 'True'
    end
  end
end
