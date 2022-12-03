require 'rspec'
require_relative 'solution'

describe 'Day 3' do
  describe 'part 1' do
    it 'sums char values' do
      input = File.read('day_3/test_input.txt').split("\n")
      expect(part_1(input)).to eq(157)
    end
  end

  describe 'part 2' do
    it 'sums char values of each group' do
      input = File.read('day_3/test_input.txt').split("\n")
      expect(part_2(input)).to eq(70)
    end
  end
end
