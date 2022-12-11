class Item2
  attr_reader :worry_level

  def initialize(level:, dividers:)
    @dividers = {}
    dividers.each { |v| @dividers[v] = level % v }
  end

  def inspect_item(operation)
    @dividers.each do |k,v|
      cmd = operation.map { |e| e == 'old' ? v : e }.join(' ')
      @dividers[k] = eval(cmd) % k
    end
  end

  def test?(value)
    @dividers.dig(value) == 0
  end
end

class Monkey2
  attr_reader :true_monkey_idx, :false_monkey_idx

  def initialize(items:, operation:, test_value:, true_monkey:, false_monkey:)
    @items = items
    @operation = operation
    @test_value = test_value
    @true_monkey_idx = true_monkey
    @false_monkey_idx = false_monkey
    @inspections_counter = 0
  end

  def set_true_false_monkey(true_monkey, false_monkey)
    @true_monkey = true_monkey
    @false_monkey = false_monkey
  end

  def throw_items
    while @items.size > 0
      item = @items.shift
      item.inspect_item(@operation)
      @inspections_counter += 1
      item.test?(@test_value) ? @true_monkey.catch_item(item) : @false_monkey.catch_item(item)
    end
  end

  def catch_item(item)
    @items << item
  end

  def monkey_business_level
    @inspections_counter
  end
end

class Game2
  def initialize(monkey_data:, dividers:)
    @monkeys = monkey_data.map do |data|
      Monkey2.new(
        items: data[1].strip.split(' ')[2..].map { |value| Item2.new(level: value.to_i, dividers: dividers) },
        operation: data[2].strip.split(' ')[3..],
        test_value: data[3].strip.split(' ').last.to_i,
        true_monkey: data[4].strip.split(' ').last.to_i,
        false_monkey: data[5].strip.split(' ').last.to_i
      )
    end
    set_true_false_monkeys
  end

  def run_rounds(n)
    n.times { @monkeys.each { |m| m.throw_items } }
  end

  def monkey_business_level
    @monkeys.map(&:monkey_business_level).max(2).inject(:*)
  end

  private

  def set_true_false_monkeys
    @monkeys.each do |monkey|
      monkey.set_true_false_monkey(@monkeys.at(monkey.true_monkey_idx), @monkeys.at(monkey.false_monkey_idx) )
    end
  end
end


def solution2(input, rounds)
  data = input.each_slice(7)
  dividers = data.map { |commands| commands[3].split(' ').last.to_i }
  game = Game2.new(monkey_data: data, dividers: dividers)
  game.run_rounds(rounds)
  game.monkey_business_level
end

input = File.read('day_11/input.txt').split("\n")
puts solution2(input, 10000)
