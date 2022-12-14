require 'pry'

class Sand
  attr_reader :x, :y, :stop

  def initialize(x, y)
    @x = x
    @y = y
    @stop = false
  end

  def move(points, floor)
    while !@stop
      if y >= floor
        @stop = true
      elsif points[[x, y + 1]].nil?
        down
      elsif points[[x - 1, y + 1]].nil?
        left
      elsif points[[x + 1, y + 1]].nil?
        right
      else
        @stop = true
      end
    end
  end

  def down
    @y += 1
  end

  def left
    @x -= 1
    @y += 1
  end

  def right
    @x += 1
    @y += 1
  end

  def [](arg)
    return x if arg == 0
    y
  end

  def xy
    [x, y]
  end
end

class Cave
  attr_reader :points, :min_x, :max_x, :min_y, :max_y, :overflown, :grains

  def initialize(sand_entry)
    @sand_entry = sand_entry
    @points = {}
    @max_x = 0
    @min_x = Float::INFINITY
    @min_y = 0
    @max_y = 0
    @overflown = false
    @grains = 0
  end

  def add_rock(p)
    @points[p] = 'rock'
    update_maxes(p)
    @max_y = p[1] if p[1] > @max_y
  end

  def add_sand(allow_drawing)
    while !overflown
      sand = Sand.new(*@sand_entry)
      while !sand.stop
        sand.move(@points, floor)
      end
      @overflown = true if sand.xy == [500, 0]
      update_maxes(sand)
      @points[sand.xy] = 'sand'
      @grains += 1
      draw if allow_drawing
    end
  end

  private

  def update_maxes(p)
    @max_x = p[0] if p[0] > @max_x
    @min_x = p[0] if p[0] < @min_x
  end

  def draw
    sleep(0.05)
    system("clear")
    lines = ['']
    (min_y..floor).each do |y|
      line = []
      (min_x - 2..max_x + 2).each { |x| line << symbol([x, y]) }
      lines << line.join('')
    end
    lines << '#' * (max_x - min_x + 5)
    puts lines
  end

  def floor
    @max_y + 1
  end

  def symbol(xy)
    case @points[xy]
    when 'rock' then '#'
    when 'sand' then 'O'
    else '.'
    end
  end
end

def add_blockers(input, cave)
  input.each do |line|
    line.split(' -> ').each_cons(2) do |l, r|
      left = l.split(',').map(&:to_i)
      right = r.split(',').map(&:to_i)
      cave.add_rock(left)
      cave.add_rock(right)
      if left[0] == right[0]
        low, high = [left[1], right[1]].sort
        (low..high).each { |y| cave.add_rock([left[0], y]) }
      else
        low, high = [left[0], right[0]].sort
        (low..high).each { |x| cave.add_rock([x, left[1]]) }
      end
    end
  end
end

def part_2(input, sand_entry, draw = false)
  cave = Cave.new(sand_entry)
  add_blockers(input, cave)
  cave.add_sand(draw)
  cave.grains
end

# input = File.read('day_14/input.txt').split("\n")
# puts part_2(input, [500, 0])
