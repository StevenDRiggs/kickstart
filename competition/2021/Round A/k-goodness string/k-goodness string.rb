T = gets.to_i

T.times{|case_num|
  nk = gets.split(' ').map{|num| num.to_i}
  n = nk[0]
  k = nk[1]

  s = gets.chomp.split('')

  mid = (n / 2)

  s1 = s[0...mid]
  s2 = s[mid..-1].reverse

  if s2.length > s1.length
    s2 = s2[0...-1]
  end

  goodness = 0

  s1.each_with_index{|c, i|
    if c != s2[i]
      goodness += 1
    end
  }

  puts "Case ##{case_num + 1}: #{(goodness - k).abs}"
}
