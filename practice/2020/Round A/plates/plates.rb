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

    def process_sums(sums_arr, to_take)
      sums_copy = sums_arr.clone.map(&:clone)
      max_stack = sums_copy.delete(sums_copy.max{|a,b| a[-1] <=> b[-1]})
      highest = max_stack[-1]
      iter_count = max_stack.length

      if to_take < 2
        sums_copy.each{|stack|
          stack.each.with_index{|val, index|
            highest = [
              highest,
              highest - max_stack[iter_count - index - 1] + val
            ].max
          }
        }

        highest
      else
        process_sums(sums_arr, to_take - 1)
      end
    end

    answer = process_sums(sums, p)
  end

  puts "Case ##{case_num + 1}: #{answer}"
}
