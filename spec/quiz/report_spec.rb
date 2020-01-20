class Report
  def first_distribution
    { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }
  end
end

describe Report do
  it 'shows a distribution of answers to the first question' do
    report = Report.new
    expect(report.first_distribution).to eq({
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0
    })
  end
end
