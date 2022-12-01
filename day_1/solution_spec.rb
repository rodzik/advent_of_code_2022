require 'rspec'
require_relative 'solution'

describe 'Part 1' do
  it 'finds the elf carrying the most calories' do
    input = File.read('day_1/test_input.txt').split("\n")
    expect(part_1(input)).to eq(24000)
  end
end
