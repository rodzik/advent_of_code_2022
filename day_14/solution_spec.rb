require 'rspec'
require_relative 'solution'

describe 'Day 14', :aggregate_failures do
  describe 'part 2' do
    it 'simulates sand' do
      input = File.read('day_14/test_input.txt').split("\n")
      expect(part_2(input, [500,0], true)).to eq(93)
    end
  end
end
