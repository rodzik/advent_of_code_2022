class Point
  attr_reader :char, :x, :y, :value

  def initialize(char, x, y)
    @char = char
    @x = x
    @y = y
    @value = find_value
  end

  private

  def find_value
    return 0 if @char == 'S'
    return 25 if @char == 'E'

    ('a'..'z').to_a.index(@char)
  end
end

def dijkstra(map, start, node_condition)
  costs = Hash.new(Float::INFINITY)
  current = start
  costs[current] = 0
  visited = []

  while !current.nil?
    possible_nodes(current, map, node_condition).each do |node|
      new_cost = costs[current] + 1
      next unless new_cost < costs[node]

      costs[node] = new_cost
    end

    visited << current
    current = lowest_cost_node(costs, visited)
  end

  costs
end

def lowest_cost_node(costs, visited)
  unvisited = costs.keys - visited
  unvisited.min_by { |n| costs[n] }
end

def possible_nodes(node, map, node_condition)
  map.select do |p|
    p != node &&
      node_condition.(node, p) &&
      (((node.x - 1..node.x + 1).include?(p.x) && node.y == p.y) || ((node.y - 1..node.y + 1).include?(p.y) && node.x == p.x))
  end
end

def map_input(input)
  start = nil
  finish = nil
  points = input.each_with_index.map do |line, y|
    line.chars.each_with_index.map do |char, x|
      p = Point.new(char, x, y)
      start = p if char == 'S'
      finish = p if char == 'E'
      p
    end
  end

  [points.flatten, start, finish]
end

def part_1(input)
  map, start, finish = map_input(input)
  costs = dijkstra(map, start, ->(current, checked) { current.value + 1 >= checked.value })
  costs[finish]
end

def part_2(input)
  map, _start, finish = map_input(input)
  costs = dijkstra(map, finish, ->(current, checked) { current.value <= checked.value + 1 })
  costs.select {|k, _v| k.value == 0 }.values.min
end

# input = File.read('day_12/input.txt').split("\n")
# puts part_1(input)
