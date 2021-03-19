T = gets.to_i

T.times{|case_num|
  nk = gets.split(' ').map{|num| num.to_i}
  n = nk[0]
  k = nk[1]

  m = gets.split(' ').map{|num| num.to_i}

  difficulties = m[1...m.length].map.with_index{|mi, i|
    mi - m[i]
  }
  difficulty = difficulties.max

  while k > 0 && difficulty > 1 do
    max_difficulty = difficulties.max
    max_difficulty_index = difficulties.find_index(max_difficulty)

    m.insert(max_difficulty_index + 1, m[max_difficulty_index] + (max_difficulty / 2).floor)

    difficulties = m[1...m.length].map.with_index{|mi, i|
      mi - m[i]
    }
    difficulty = difficulties.max

    k -= 1
  end

  puts "Case ##{case_num + 1}: #{difficulty}"
}
