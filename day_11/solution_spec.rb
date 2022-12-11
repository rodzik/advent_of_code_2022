require 'rspec'
require_relative 'solution'
require_relative 'solution_2'

describe 'Day 11', :aggregate_failures do
  describe 'part 1' do
    it 'calculates level of monkey business' do
      input = File.read('day_11/test_input.txt').split("\n")
      expect(part_1(input)).to eq(10605)
    end
  end

  describe 'part 2' do
    it 'calculates level of monkey business' do
      input = File.read('day_11/test_input.txt').split("\n")
      expect(solution2(input, 1)).to eq(4 * 6)
      expect(solution2(input, 20)).to eq(99 * 103)
      expect(solution2(input, 1000)).to eq(5204 * 5192)
    end
  end
end
