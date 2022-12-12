require 'rspec'
require_relative 'solution'

describe 'Day 12', :aggregate_failures do
  describe 'part 1' do
    it 'shortest path' do
      input = File.read('day_12/test_input.txt').split("\n")
      expect(part_1(input)).to eq(31)
    end
  end
end
