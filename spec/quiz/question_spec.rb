require_relative '../../app/models/question'

describe Question do
  context 'when the options are "True" and "False"' do
    it 'has "True" as the first option' do
      question = Question.new(text: anything, options: ["True", "False"])
      expect(question.first_option).to eq "True"
    end
  end
end
