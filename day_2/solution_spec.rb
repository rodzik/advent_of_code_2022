require 'rspec'
require_relative 'solution'

describe 'Day 2' do
  describe 'part 1' do
    it 'counts points' do
      input = File.read('day_2/test_input.txt').split("\n")
      expect(part_1(input)).to eq(15)
    end
  end
end
