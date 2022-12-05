def part_1(input)
  separator_index = input.index('')
  columns_count = input[separator_index - 1].gsub(' ', '').size
  columns = input[0..separator_index - 2].map do |r|
    a = Array.new(columns_count, nil);
    r.scan(/....?/).each_with_index { |e, i| a[i] = (e.gsub(' ', '') == '' ? nil : e.tr(' []', '')) }
    a
  end.transpose.map(&:compact)

  input[separator_index + 1..].each do |instruction|
    n, from, to = instruction.split(' ').select.with_index{ |_, i| (i + 1) % 2 == 0 }.map(&:to_i)

    n.times do
      crate = columns[from - 1].shift
      columns[to - 1].unshift(crate)
    end
  end

  columns.map(&:first).join('')
end

def part_2(input)
  separator_index = input.index('')
  columns_count = input[separator_index - 1].gsub(' ', '').size
  columns = input[0..separator_index - 2].map do |r|
    a = Array.new(columns_count, nil);
    r.scan(/....?/).each_with_index { |e, i| a[i] = (e.gsub(' ', '') == '' ? nil : e.tr(' []', '')) }
    a
  end.transpose.map(&:compact)

  input[separator_index + 1..].each do |instruction|
    n, from, to = instruction.split(' ').select.with_index{ |_, i| (i + 1) % 2 == 0 }.map(&:to_i)
    crates = columns[from - 1].shift(n)
    crates = [crates] if n == 1
    columns[to - 1].unshift(*crates)
  end

  columns.map(&:first).join('')
end

input = File.read('day_5/input.txt').split("\n")
puts part_1(input)
puts part_2(input)
