require_relative '../lib/challange'
RSpec.describe Challange do
  context 'when the payment is exact' do
    it 'returns an array of zeroes' do
      expect(Challange::Money.calculate_change(10.00, 10.00)).to eq([0, 0, 0, 0, 0, 0, 0 ,0 ,0, 0])
    end
  end

  context 'when payment if more than cost' do
    it 'returns the correct change' do
      expect(Challange::Money.calculate_change(25.75, 30.00)).to eq([0, 0, 0, 0, 0, 4, 1, 0 ,0, 0])
    end
  end

  context 'when payment is less than the cost' do
    it 'raises an error' do
      expect { Challange::Money.calculate_change(50.00, 25.00)}.to raise_error(ArgumentError)
    end
  end

  context 'when dealing with small amounts' do
    it ' small amounts' do
      expect(Challange::Money.calculate_change(0.99, 1)).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 1])
    end
  end
end
