def part_1(input)
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

  sizes.select { |_k,v| v <= 100000 }.values.sum
end


input = File.read('day_7/input.txt').split("\n")
puts part_1(input)
