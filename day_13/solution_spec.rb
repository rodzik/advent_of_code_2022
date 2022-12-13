require 'rspec'
require_relative 'solution'

describe 'Day 13', :aggregate_failures do
  describe 'part 1' do
    it 'sums pairs' do
      input = File.read('day_13/test_input.txt').split("\n")
      expect(part_1(input)).to eq(13)
    end
  end

  describe 'part 2' do
    it 'sums pairs' do
      input = File.read('day_13/test_input.txt').split("\n")
      expect(part_2(input)).to eq(140)
    end
  end
end
