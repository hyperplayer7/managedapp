require_relative './../app/computation'

RSpec.describe Computation do
  it 'check answer if equal to 1' do
    expect(described_class.new('01/01/2001', '03/01/2001').call).to eq '1 days'
  end

  it 'check answer if equal to 0' do
    expect(described_class.new('01/01/2001', '02/01/2001').call).to eq '0 days'
  end

  it 'check answer if equal to 0' do
    expect(described_class.new('01/01/2001', '01/01/2001').call).to eq '0 days'
  end

  it 'check answer if equal to 19' do
    expect(described_class.new('02/06/1983', '22/06/1983').call).to eq '19 days'
  end

  it 'check answer if equal to 173' do
    expect(described_class.new('04/07/1984', '25/12/1984').call).to eq '173 days'
  end

  it 'check answer if equal to 1979' do
    expect(described_class.new('03/01/1989', '03/08/1983').call).to eq '1979 days'
  end

  it 'check answer if equal to 1979' do
    expect(described_class.new('03/08/1983', '03/01/1989').call).to eq '1979 days'
  end
end
