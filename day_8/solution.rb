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

def part_2(input)
  trees = input.map { |row| row.split('').map(&:to_i) }
  max_score = 0

  trees.each_with_index do |line, y|
    line.each_with_index do |tree, x|
      next if x == 0 || x == line.size - 1 || y == 0 || y == trees.size - 1

      scores = Hash.new(0)
      i = 1
      while(x+i < line.size)
        scores[:right] += 1
        break if trees[y][x+i] >= tree
        i += 1
      end

      i = 1
      while(x-i >= 0)
        scores[:left] += 1
        break if trees[y][x-i] >= tree
        i += 1
      end

      i = 1
      while(y+i < trees.size)
        scores[:down] += 1
        break if trees[y+i][x] >= tree
        i += 1
      end

      i = 1
      while(y-i >= 0)
        scores[:up] += 1
        break if trees[y-i][x] >= tree
        i += 1
      end

      score = scores.values.reduce(:*)
      max_score = score if score > max_score
    end
  end

  max_score
end

input = File.read('day_8/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
