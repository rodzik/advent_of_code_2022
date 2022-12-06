def solution(input, width)
  chars = input.chars
  counter = width - 1
  while counter <= chars.size - 1
    slice = chars[counter - (width - 1)..counter]
    break if slice == slice.uniq

    counter += 1
  end

  counter + 1
end

input = File.read('day_6/input.txt')
puts solution(input, 4)
puts solution(input, 14)
