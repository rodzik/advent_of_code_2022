require 'rspec'
require_relative 'solution'

describe 'Day 11', :aggregate_failures do
  describe 'part 1' do
    it 'calculates level of monkey business' do
      input = File.read('day_11/test_input.txt').split("\n")
      expect(part_1(input)).to eq(10605)
    end
  end
end
