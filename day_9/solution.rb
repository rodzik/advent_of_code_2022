class Knot
  attr_reader :x, :y

  def initialize
    @x = 0
    @y = 0
    @positions = [[0, 0]]
  end

  def move(dir)
    case dir
    when 'R' then @x += 1
    when 'L' then @x -= 1
    when 'U' then @y += 1
    when 'D' then @y -= 1
    end
  end

  def align_with_knot(head)
    return unless alignment_needed?(head)

    align(head)
  end

  def positions_count
    @positions.uniq.size
  end

  private

  def alignment_needed?(head)
    !((head.x - 1..head.x + 1).include?(x) &&  (head.y - 1..head.y + 1).include?(y))
  end

  def align(head)
    if head.x != x && head.y != y
      move_x(head)
      move_y(head)
    elsif (head.x - x).abs > 1
      move_x(head)
    elsif (head.y - y).abs > 1
      move_y(head)
    end

    @positions << [x, y]
  end

  def move_x(head)
    @x += 1 if head.x > x
    @x -= 1 if head.x < x
  end

  def move_y(head)
    @y += 1 if head.y > y
    @y -= 1 if head.y < y
  end
end

class Line
  def initialize(knots_count)
    @knots = Array.new(knots_count) { Knot.new }
  end

  def move(cmd)
    dir = cmd.split(' ')[0]
    amount = cmd.split(' ')[1].to_i
    amount.times { |_| move_knots(dir) }
  end

  def tail_positions_count
    @knots.last.positions_count
  end

  private

  def move_knots(dir)
    @knots.each_with_index do |knot, i|
      if i == 0
        knot.move(dir)
      else
        knot.align_with_knot(@knots[i - 1])
      end
    end
  end
end

def solution(input, knots_count)
  line = Line.new(knots_count)
  input.each { |cmd| line.move(cmd) }
  line.tail_positions_count
end

input = File.read('day_9/input.txt').split("\n")
puts solution(input, 2)
puts solution(input, 10)
