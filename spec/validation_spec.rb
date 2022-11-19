require_relative './../app/validation'

RSpec.describe Validation do
  it 'checks null input and should return invalid format' do
    expect { described_class.new(nil, nil).call }.to raise_error(RuntimeError, 'Invalid Format')
  end

  it 'checks empty string and should return invalid format' do
    expect { described_class.new('', '').call }.to raise_error(RuntimeError, 'Invalid Format')
  end

  it 'checks invalid format string and should return invalid format' do
    expect { described_class.new('1', '2').call }.to raise_error(RuntimeError, 'Invalid Format')
  end

  it 'checks invalid format date and should return invalid format' do
    expect { described_class.new('1/1/1111', '1/1/1111').call }.to raise_error(RuntimeError, 'Invalid Format')
  end

  it 'The valid date range is between 01/01/1900 and 31/12/2999, all other dates should be rejected.' do
    expect { described_class.new('01/01/1899', '01/01/3000').call }.to raise_error(RuntimeError, 'Invalid Year')
  end

  it 'The valid date range is between 01/01/1900 and 31/12/2999, all other dates should be rejected.' do
    expect { described_class.new('01/01/1899', '01/01/2999').call }.to raise_error(RuntimeError, 'Invalid Year')
  end

  it 'The valid date range is between 01/01/1900 and 31/12/2999, all other dates should be rejected.' do
    expect { described_class.new('01/01/1900', '01/01/3000').call }.to raise_error(RuntimeError, 'Invalid Year')
  end

  it 'check reverse date range and should return invalid year' do
    expect { described_class.new('01/01/3000', '01/01/1899').call }.to raise_error(RuntimeError, 'Invalid Year')
  end

  it 'check reverse date range and should pass' do
    expect(described_class.new('01/01/2999', '01/01/1900').call).to eq nil
  end

  it 'check date range and should pass' do
    expect(described_class.new('01/01/1900', '01/01/1900').call).to eq nil
  end

  it 'check date range and should pass' do
    expect(described_class.new('01/01/2999', '01/01/2999').call).to eq nil
  end

  it 'check date range and should return invalid year' do
    expect { described_class.new('01/01/3000', '01/01/3000').call }.to raise_error(RuntimeError, 'Invalid Year')
  end

  it 'check date range and should return invalid year' do
    expect { described_class.new('01/01/1899', '01/01/1899').call }.to raise_error(RuntimeError, 'Invalid Year')
  end
end
