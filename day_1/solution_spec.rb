require 'rspec'
require_relative 'solution'

describe 'Day 1' do
  describe 'part 1' do
    it 'finds the the most calories carried by an elf' do
      input = File.read('day_1/test_input.txt').split("\n")
      expect(part_1(input)).to eq(24000)
    end
  end

  describe 'part 2' do
    it 'finds sum of calories carried by 3 elves' do
      input = File.read('day_1/test_input.txt').split("\n")
      expect(part_2(input)).to eq(45000)
    end
  end
end
