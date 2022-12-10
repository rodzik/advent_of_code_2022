require 'rspec'
require_relative 'solution'

describe 'Day 9', :aggregate_failures do
  describe 'part 1' do
    it 'find signal strength' do
      input = File.read('day_9/test_input.txt').split("\n")
      expect(part_1(input)).to eq(13)
    end
  end
end
