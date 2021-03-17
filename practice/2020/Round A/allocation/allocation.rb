T = gets().to_i

T.times do |case_num|
  nb = gets().split(' ')
  n = nb[0].to_i
  b = nb[1].to_i

  def counting_sort(arr)
    max_value = arr.max
    counts = [0] * (max_value + 1)
    arr.each {|val| counts[val] += 1}

    num_items_before = 0
    counts.each_with_index{|count, index|
      counts[index] = num_items_before
      num_items_before += count
    }

    sorted_array = [0] * arr.length

    arr.each{|val|
      sorted_array[counts[val]] = val
      counts[val] += 1
    }

    sorted_array
  end

  a = counting_sort(gets().split(' ').map{|ai| ai.to_i})

  count = 0

  #if b >= 1000 * n
  #  puts "Case ##{case_num + 1}: #{(b / n).floor}"
  #else 
    while a.length > 0 && a[0] <= b do
      count += 1
      b -= a.shift
    end
    puts "Case ##{case_num + 1}: #{count}"
  #end
end


