require 'rspec'
require_relative 'solution'

describe 'Day 4' do
  describe 'part 1' do
    it 'counts areas' do
      input = File.read('day_4/test_input.txt').split("\n")
      expect(part_1(input)).to eq(2)
    end
  end

  describe 'part 1' do
    it 'counts overlapping areas' do
      input = File.read('day_4/test_input.txt').split("\n")
      expect(part_2(input)).to eq(4)
    end
  end
end
