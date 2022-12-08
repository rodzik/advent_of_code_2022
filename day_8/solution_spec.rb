require 'rspec'
require_relative 'solution'

describe 'Day 8', :aggregate_failures do
  describe 'part 1' do
    it 'find trees' do
      input = File.read('day_8/test_input.txt').split("\n")
      expect(part_1(input)).to eq(21)
    end
  end

  describe 'part 2' do
    it 'finds best view' do
      input = File.read('day_8/test_input.txt').split("\n")
      expect(part_2(input)).to eq(8)
    end
  end
end
