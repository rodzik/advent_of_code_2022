def part_1(input)
  trees = input.map { |row| row.split('').map(&:to_i) }
  visible_trees = []

  trees.each_with_index do |line, y|
    line.each_with_index do |tree, x|
      visible_trees << [x,y] if x == 0 || x == line.size - 1 || !(line[...x].any? { |t| t >= tree }) || !(line[(x + 1)..].any? { |t| t >= tree })
    end
  end

  trees.transpose.each_with_index do |line, y|
    line.each_with_index do |tree, x|
      visible_trees << [y, x] if x == 0 || x == line.size - 1 || !(line[...x].any? { |t| t >= tree }) || !(line[(x + 1)..].any? { |t| t >= tree })
    end
  end

  visible_trees.uniq.size
end

input = File.read('day_8/input.txt').split("\n")
puts part_1(input)
