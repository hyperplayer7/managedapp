require_relative './../app/leap_year'

RSpec.describe LeapYear do
  it 'check answer if equal to 0' do
    expect(described_class.new('01/01/2001', '03/01/2001').call).to eq 0
  end

  it 'check answer if equal to 0' do
    expect(described_class.new('02/06/1983', '22/06/1983').call).to eq 0
  end

  it 'check answer if equal to 0' do
    expect(described_class.new('04/07/1984', '25/12/1984').call).to eq 0
  end

  it 'check answer if equal to 0' do
    expect(described_class.new('01/01/1984', '02/02/1984').call).to eq 0
  end

  it 'is a leap year but should be 0 since days will already be added' do
    expect(described_class.new('01/01/1984', '02/29/1984').call).to eq 0
  end

  it 'is a leap year but should be 0 since days will already be added' do
    expect(described_class.new('02/29/1984', '01/01/1984').call).to eq 0
  end

  it 'is a leap year but should be 0 since did not pass through feb' do
    expect(described_class.new('01/01/1984', '01/01/1984').call).to eq 0
  end

  it 'is a leap year but should be 0 since did not pass through feb' do
    expect(described_class.new('01/01/1984', '01/01/1988').call).to eq 0
  end

  it 'is a leap year but should be 0 since did not pass through feb' do
    expect(described_class.new('01/03/1984', '01/01/1988').call).to eq 0
  end

  it 'is a leap year but should be 0 since did not pass through feb' do
    expect(described_class.new('01/01/1984', '01/03/1988').call).to eq 0
  end

  it 'is a leap year but should be 0 since did not pass through feb' do
    expect(described_class.new('01/02/1984', '01/02/1988').call).to eq 0
  end

  it 'is a leap year but should be 0 since did not pass through feb' do
    expect(described_class.new('28/02/1984', '01/02/1988').call).to eq 0
  end

  it 'is a leap year but should be 1 since did not pass through feb' do
    expect(described_class.new('28/02/1983', '01/02/1985').call).to eq 1
  end
end
