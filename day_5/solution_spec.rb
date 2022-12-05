require 'rspec'
require_relative 'solution'

describe 'Day 5' do
  describe 'part 1' do
    it 'moves crates' do
      input = File.read('day_5/test_input.txt').split("\n")
      expect(part_1(input)).to eq('CMZ')
    end
  end

  describe 'part 2' do
    it 'moves multiple crates' do
      input = File.read('day_5/test_input.txt').split("\n")
      expect(part_2(input)).to eq('MCD')
    end
  end
end
