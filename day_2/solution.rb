require 'pry'

def part_1(input)
  opponent_code = {
    'A' => 'rock',
    'B' => 'paper',
    'C' => 'scissors'
  }

  my_code = {
    'X' => 'rock',
    'Y' => 'paper',
    'Z' => 'scissors'
  }

  shape_table = {
    'rock' => 'paper',
    'paper' => 'scissors',
    'scissors' => 'rock'
  }

  shape_scores = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }


  points = 0
  input.each do |line|
    opponent_shape = opponent_code[line.split(' ')[0]]
    my_shape = my_code[line.split(' ')[1]]

    points += shape_scores[my_shape]
    points += 3 if opponent_shape == my_shape
    points += 6 if my_shape == shape_table[opponent_shape]
  end

  points
end

def part_2(input)
  opponent_code = {
    'A' => 'rock',
    'B' => 'paper',
    'C' => 'scissors'
  }

  outcome_code = {
    'X' => 'loose',
    'Y' => 'draw',
    'Z' => 'win'
  }

  shape_table = {
    'rock' => 'paper',
    'paper' => 'scissors',
    'scissors' => 'rock'
  }

  shape_scores = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }

  points = 0
  input.each do |line|
    opponent_shape = opponent_code[line.split(' ')[0]]
    my_shape = case outcome_code[line.split(' ')[1]]
               when 'loose' then shape_table.key(opponent_shape)
               when 'win' then shape_table[opponent_shape]
               else
                 opponent_shape
               end

    points += shape_scores[my_shape]
    points += 3 if opponent_shape == my_shape
    points += 6 if my_shape == shape_table[opponent_shape]
  end

  points
end

input = File.read('day_2/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
