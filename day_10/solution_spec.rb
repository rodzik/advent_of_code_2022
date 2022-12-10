require 'rspec'
require_relative 'solution'

describe 'Day 10', :aggregate_failures do
  describe 'part 1' do
    it 'find signal strength' do
      input = File.read('day_10/test_input.txt').split("\n")
      expect(part_1(input)).to eq(13140)
    end
  end

  describe 'part 2' do
    it 'prints crt' do
      input = File.read('day_10/test_input.txt').split("\n")
      expect(part_2(input)[0]).to eq('##..##..##..##..##..##..##..##..##..##..')
      expect(part_2(input)[1]).to eq('###...###...###...###...###...###...###.')
      expect(part_2(input)[2]).to eq('####....####....####....####....####....')
      expect(part_2(input)[3]).to eq('#####.....#####.....#####.....#####.....')
      expect(part_2(input)[4]).to eq('######......######......######......####')
      expect(part_2(input)[5]).to eq('#######.......#######.......#######.....')
    end
  end
end
