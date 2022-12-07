require 'rspec'
require_relative 'solution'

describe 'Day 6', :aggregate_failures do
  describe 'part 1' do
    it 'sums sizes markers' do
      input = File.read('day_7/test_input.txt').split("\n")
      expect(part_1(input)).to eq(95437)
    end
  end
end
