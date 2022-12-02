require 'rspec'
require_relative 'solution'

describe 'Day 2' do
  describe 'part 1' do
    it 'counts points' do
      input = File.read('day_2/test_input.txt').split("\n")
      expect(part_1(input)).to eq(15)
    end
  end

  describe 'part 2' do
    it 'counts points' do
      input = File.read('day_2/test_input.txt').split("\n")
      expect(part_2(input)).to eq(12)
    end
  end
end
