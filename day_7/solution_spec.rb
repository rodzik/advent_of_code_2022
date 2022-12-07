require 'rspec'
require_relative 'solution'

describe 'Day 6', :aggregate_failures do
  describe 'part 1' do
    it 'sums sizes markers' do
      input = File.read('day_7/test_input.txt').split("\n")
      expect(solution(input)[:sum]).to eq(95437)
    end
  end

  describe 'part 2' do
    it 'sums sizes markers' do
      input = File.read('day_7/test_input.txt').split("\n")
      expect(solution(input)[:smallest_dir_size_for_deletion]).to eq(24933642)
    end
  end
end
