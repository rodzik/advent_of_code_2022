require 'pry'

def solution(input)
  dirs = []
  sizes = Hash.new(0)

  input.each do |line|
    cmd = line.split(' ')

    case cmd[0]
    when '$'
      case cmd[1]
      when 'cd'
        case cmd[2]
        when '..' then dirs.pop
        when '/' then dirs = ['/']
        else
          dirs << cmd[2]
        end
      when 'ls' then nil # do nothing
      end
    when 'dir' then nil # do nothing
    else
      dirs.each_with_index {|_e, index| sizes[dirs[..index].join('/')] += cmd[0].to_i }
    end
  end

  sum = sizes.select { |_k,v| v <= 100000 }.values.sum

  dir_size = Float::INFINITY
  needed_space = 30000000 - (70000000 - sizes['/'])
  sizes.each { |dir, size| size >= needed_space ? (dir_size = size if size < dir_size) : nil }
  dir_size

  { sum: sum, smallest_dir_size_for_deletion: dir_size}
end

input = File.read('day_7/input.txt').split("\n")
puts solution(input)[:sum]
puts solution(input)[:smallest_dir_size_for_deletion]
