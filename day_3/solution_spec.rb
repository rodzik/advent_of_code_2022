require 'rspec'
require_relative 'solution'

describe 'Day 3' do
  describe 'part 1' do
    it 'counts points' do
      input = File.read('day_3/test_input.txt').split("\n")
      expect(part_1(input)).to eq(157)
    end
  end
end
