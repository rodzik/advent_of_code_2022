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

def part_2(input)
  current_calories = 0
  top_3 = []

  input.each do |calories|
    if calories == ''
      if current_calories > top_3.min.to_i
        top_3 << current_calories
        top_3.sort!.shift if top_3.size > 3
      end

      current_calories = 0
    else
      current_calories += calories.to_i
    end
  end

  if current_calories > top_3.min.to_i
    top_3 << current_calories
    top_3.sort!.shift if top_3.size > 3
  end

  top_3.sum
end

input = File.read('day_1/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
