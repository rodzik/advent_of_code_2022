require 'pry'

def part_1(input)
  max_calories = 0
  current_calories = 0

  input.each do |calories|
    if calories == ''
      max_calories = current_calories if current_calories > max_calories
      current_calories = 0
    else
      current_calories += calories.to_i
    end
  end

  [max_calories, current_calories].max
end

input = File.read('day_1/input.txt').split("\n")
puts part_1(input)
