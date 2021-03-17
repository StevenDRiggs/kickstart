t = Random.rand(100) + 1
puts t

t.times{
  n = Random.rand(100000) + 1
  b = Random.rand(100000) + 1
  a = []

  n.times{
    a << Random.rand(1000) + 1
  }

  puts "#{n} #{b}"
  puts a.join(' ')
}
