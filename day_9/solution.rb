class Line
  def initialize
    @hx = 0
    @hy = 0
    @tx = 0
    @ty = 0
    @tail_positions = [[0,0]]
  end

  def move(cmd)
    dir = cmd.split(' ')[0]
    amount = cmd.split(' ')[1].to_i
    amount.times { |_| move_head(dir) }
  end

  def tail_positions_count
    @tail_positions.uniq.size
  end

  private

  def move_head(dir)
    case dir
    when 'R' then @hx += 1
    when 'L' then @hx -= 1
    when 'U' then @hy += 1
    when 'D' then @hy -= 1
    end

    move_tail if tail_move_needed?
  end

  def tail_move_needed?
    !((@hx - 1..@hx + 1).include?(@tx) &&  (@hy - 1..@hy + 1).include?(@ty))
  end

  def move_tail
    if @hx != @tx && @hy != @ty
      move_tail_x
      move_tail_y
    elsif (@hx - @tx).abs > 1
      move_tail_x
    elsif (@hy - @ty).abs > 1
      move_tail_y
    end

    @tail_positions << [@tx, @ty]
  end

  def move_tail_x
    @tx += 1 if @hx > @tx
    @tx -= 1 if @hx < @tx
  end

  def move_tail_y
    @ty += 1 if @hy > @ty
    @ty -= 1 if @hy < @ty
  end
end

def part_1(input)
  line = Line.new
  input.each { |cmd| line.move(cmd) }
  line.tail_positions_count
end

input = File.read('day_9/input.txt').split("\n")
puts part_1(input)
