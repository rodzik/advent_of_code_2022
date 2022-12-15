require 'rspec'
require_relative 'solution'

describe 'Day 14', :aggregate_failures do
  describe 'part 1' do
    it 'similates sand' do
      input = File.read('day_14/test_input.txt').split("\n")
      expect(part_1(input, [500,0])).to eq(24)
    end
  end
end
