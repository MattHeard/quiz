class Report
  def total_choices(question:, option:)
    0
  end
end

describe Report do
  context 'when there are no quiz responses' do
    it 'shows 0 choices of the first option for the first question' do
      report = Report.new
      expect(report.total_choices(question: 1, option: 1)).to eq 0
    end
  end
end
