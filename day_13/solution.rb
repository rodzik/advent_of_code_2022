require 'pry'
class Packet
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def <=>(other)
    my_value = Marshal.load(Marshal.dump(value))
    other_value = Marshal.load(Marshal.dump(other.value))
    in_order?(my_value, other_value) ? -1 : 1
  end

  def <(other)
    my_value = Marshal.load( Marshal.dump(value) )
    other_value = Marshal.load( Marshal.dump(other.value) )
    in_order?(my_value, other_value)
  end

  private

  def in_order?(left, right, result = { value: nil })
    while result[:value].nil?
      l = left.shift
      r = right.shift

      result[:value] = l < r if l.is_a?(Integer) && r.is_a?(Integer) && l != r
      result[:value] = true if l.nil? && !r.nil?
      result[:value] = false if !l.nil? && r.nil?
      result[:value] = l < r if l.is_a?(Integer) && r.is_a?(Integer) && l != r
      in_order?(l, r, result) if l.is_a?(Array) && r.is_a?(Array)
      in_order?(l, [r], result) if l.is_a?(Array) && !r.is_a?(Array)
      in_order?([l], r, result) if !l.is_a?(Array) && r.is_a?(Array)
      break if l.nil? && r.nil?
    end

    result[:value]
  end
end

def part_1(input)
  counter = 0
  input.each_slice(3).each_with_index do |pair, i|
    left = Packet.new(eval(pair[0]))
    right = Packet.new(eval(pair[1]))

    counter += (i + 1) if left < right
  end

  counter
end

def part_2(input)
  packet_2 = Packet.new([[2]])
  packet_6 = Packet.new([[6]])
  packets = [packet_2, packet_6]

  input.each do |line|
    next if line == ''
    packets << Packet.new(eval(line))
  end

  packets.sort!
  (packets.index(packet_2) + 1) * (packets.index(packet_6) + 1)
end

input = File.read('day_13/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
