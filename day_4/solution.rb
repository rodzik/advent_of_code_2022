def part_1(input)
  counter = 0
  input.each do |line|
    left, right = line.split(',').map { |r| r.split('-').map(&:to_i) }
    counter += 1 if (left[0] <= right[0] && left[1] >= right[1]) || (right[0] <= left[0] && right[1] >= left[1])
  end

  counter
end

def part_2(input)
  counter = 0
  input.each do |line|
    l, r = line.split(',').map { |r| r.split('-').map(&:to_i) }
    l_range = l[0]..l[1]
    r_range = r[0]..r[1]
    counter += 1 if l_range.include?(r[0]) || l_range.include?(r[1]) || r_range.include?(l[0]) || r_range.include?(l[1])
  end

  counter
end

input = File.read('day_4/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
