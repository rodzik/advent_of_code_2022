require 'pry'

class Sensor
  attr_reader :x, :y, :bx, :by, :r
  def initialize(x, y, bx, by)
    @x = x
    @y = y
    @bx = bx
    @by = by
    @r = (bx - x).abs + (by - y).abs
  end

  def affects_line?(line)
    (y - r..y + r).include?(line)
  end

  def affects_point?(p)
    return false if p == beacon
    return false unless affects_line?(p[1])

    range(p[1]).include?(p[0])
  end

  def range(line)
    c = (line - y).abs
    (x + c - r)..(x - c + r)
  end

  def beacon
    [bx, by]
  end

  def min_x
    x - r
  end

  def max_x
    x + r
  end

  def min_y
    y - r
  end

  def max_y
    y + r
  end
end

def part_1(input, line)
  sensors = []
  max_x = -Float::INFINITY
  min_x = Float::INFINITY
  max_y = -Float::INFINITY
  min_y = Float::INFINITY

  input.each do |line|
    arr = line.split('=')
    x = arr[1].to_i
    y = arr[2].to_i
    bx = arr[3].to_i
    by = arr[4].to_i
    sensors << Sensor.new(x, y, bx, by)
  end

  sensors.each do |s|
    max_x = s.max_x if s.max_x > max_x
    min_x = s.min_x if s.min_x < min_x
    max_y = s.max_y if s.max_y > max_y
    min_y = s.min_y if s.min_y < min_y
  end

  free = 0
  beacons = 0
  taken = 0

  (min_x..max_x).each do |i|
    if sensors.any? { |s| s.beacon == [i, line] }
      beacons += 1
      next
    end
    if sensors.any? { |s| s.affects_point?([i, line]) }
      taken += 1
    else
      free += 1
    end
  end

  taken
end

input = File.read('day_15/input.txt').split("\n")
puts part_1(input, 2000000)
