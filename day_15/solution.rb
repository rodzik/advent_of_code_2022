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
def setup_sensors(input)
  input.map do |line|
    arr = line.split('=')
    x = arr[1].to_i
    y = arr[2].to_i
    bx = arr[3].to_i
    by = arr[4].to_i
    Sensor.new(x, y, bx, by)
  end
end

def part_1(input, line)
  sensors = setup_sensors(input)

  max_x = -Float::INFINITY
  min_x = Float::INFINITY
  max_y = -Float::INFINITY
  min_y = Float::INFINITY

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

def part_2(input, boundary)
  sensors = setup_sensors(input)
  distress_beacon = nil

  y = 0
  while y < boundary && !distress_beacon
    x = 0
    while x < boundary && !distress_beacon
      puts "#{y}, #{x}"
      affecting = sensors.select { |s| s.affects_point?([x, y]) }

      if affecting == []
        distress_beacon = [x, y]
        break
      end

      affecting.each do |s|
        x = s.range(y).max if s.range(y).max > x
      end

      x += 1
    end

    y += 1
  end

  distress_beacon[0] * 4000000 + distress_beacon[1]
end

input = File.read('day_15/input.txt').split("\n")
# puts part_1(input, 2000000)
# puts part_2(input, 4000000)
