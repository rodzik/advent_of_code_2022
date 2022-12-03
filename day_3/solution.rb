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

def part_2(input)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a
  score = 0

  input.each_slice(3) do |lines|
    element = lines.map { |s| s.split('') }.reduce(:&)[0]
    score += chars.index(element) + 1
  end

  score
end

input = File.read('day_3/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
