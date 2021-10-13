T = Random.rand(100) + 1

letters = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

puts T

T.times{
  n = Random.rand(100) + 1
  puts "#{n} #{(n / 2)}"
  n.times{
    print letters.sample
  }
  print "\n"
}
