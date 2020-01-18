class Quiz
  def complete?
    false
  end
end

describe Quiz do
  describe '#complete?' do
    context 'when no questions have been answered' do
      it 'is not complete' do
        quiz = Quiz.new
        expect(quiz).to_not be_complete
      end
    end
  end
end
