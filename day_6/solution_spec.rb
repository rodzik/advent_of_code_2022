require 'rspec'
require_relative 'solution'

describe 'Day 6', :aggregate_failures do
  describe 'part 1' do
    it 'finds markers' do
      input = File.read('day_6/test_input.txt').split("\n")
      expect(solution(input[0], 4)).to eq(7)
      expect(solution(input[1], 4)).to eq(5)
      expect(solution(input[2], 4)).to eq(6)
      expect(solution(input[3], 4)).to eq(10)
      expect(solution(input[4], 4)).to eq(11)
    end
  end

  describe 'part 1' do
    it 'finds messages' do
      input = File.read('day_6/test_input.txt').split("\n")
      expect(solution(input[0], 14)).to eq(19)
      expect(solution(input[1], 14)).to eq(23)
      expect(solution(input[2], 14)).to eq(23)
      expect(solution(input[3], 14)).to eq(29)
      expect(solution(input[4], 14)).to eq(26)
    end
  end
end
