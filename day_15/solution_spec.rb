require 'rspec'
require_relative 'solution'

describe 'Day 15', :aggregate_failures do
  describe 'part 1' do
    it 'simulates sand' do
      input = File.read('day_15/test_input.txt').split("\n")
      expect(part_1(input, 10)).to eq(26)
    end
  end
end
