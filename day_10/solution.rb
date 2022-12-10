class Register
  def initialize
    @value = 1
    @cycle = 0
    @record = {}
    @screen = []
  end

  def noop(_arg = nil)
    draw_pixel
    @cycle += 1
    record_cycle
  end

  def addx(value)
    noop
    noop
    @value += value.to_i
  end

  def signal_strength
    @record.sum { |k, v| k * v }
  end

  def crt
    @screen.each_slice(40).map(&:join)
  end

  private

  def record_cycle
    return unless recordable?
    @record[@cycle] = @value
  end

  def recordable?
    @cycle == 20 || (@cycle - 20) % 40 == 0
  end

  def draw_pixel
    pixel = (@value-1..@value+1).include?(@cycle % 40) ? '#' : '.'
    @screen << pixel
  end
end

def part_1(input)
  r = Register.new
  input.each { |cmd| r.public_send(*cmd.split(' ')) }
  r.signal_strength
end

def part_2(input)
  r = Register.new
  input.each { |cmd| r.public_send(*cmd.split(' ')) }
  r.crt
end

input = File.read('day_10/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
