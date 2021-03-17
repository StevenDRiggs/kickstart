T = gets.to_i

T.times{|case_num|
  nkp = gets.split(' ').map{|num| num.to_i}
  n = nkp[0]
  k = nkp[1]
  p = nkp[2]

  stacks = []
  sums = []
  n.times{
    stack = gets.split(' ').map{|num| num.to_i}.shift(p)
    stacks << stack
    sums << []
  }

  if n == 1
    answer = stacks[0].sum
  else
    stacks.each.with_index{|stack, i|
      total = 0
      stack.each_with_index{|plate, j|
        sums[i][j] = total + plate
        total += plate
      }
    }

    puts "sums: #{sums}"
  end

  puts "Case ##{case_num + 1}: #{answer}"
}
