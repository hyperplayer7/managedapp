require_relative './../app/switcher'

RSpec.describe Switcher do
  it 'check answer if equal to false' do
    expect(described_class.new('01/01/2001', '03/01/2001').call).to eq false
  end

  it 'check answer if equal to true' do
    expect(described_class.new('03/01/2001', '01/01/2001').call).to eq true
  end

  it 'check answer if equal to false' do
    expect(described_class.new('02/06/1983', '22/06/1983').call).to eq false
  end

  it 'check answer if equal to true' do
    expect(described_class.new('02/07/1983', '22/06/1983').call).to eq true
  end

  it 'check answer if equal to false' do
    expect(described_class.new('04/07/1984', '25/12/1985').call).to eq false
  end

  it 'check answer if equal to true' do
    expect(described_class.new('01/01/1985', '02/02/1984').call).to eq true
  end

  it 'check answer if equal to false' do
    expect(described_class.new('01/01/1984', '01/01/1984').call).to eq false
  end
end
