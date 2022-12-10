require 'rspec'
require_relative 'solution'

describe 'Day 9', :aggregate_failures do
  describe 'part 1' do
    it 'finds tail positions' do
      input = File.read('day_9/test_input.txt').split("\n")
      expect(solution(input, 2)).to eq(13)
    end
  end

  describe 'part 1' do
    it 'finds tails positions' do
      input = File.read('day_9/test_input_2.txt').split("\n")
      expect(solution(input, 10)).to eq(36)
    end
  end
end
