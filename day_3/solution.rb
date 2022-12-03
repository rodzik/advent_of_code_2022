def part_1(input)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a
  score = 0

  input.each do |line|
    left, right = line.split('').each_slice(line.size / 2).to_a
    element = (left & right)[0]
    score += chars.index(element) + 1
  end

  score
end

input = File.read('day_3/input.txt').split("\n")
puts part_1(input)
