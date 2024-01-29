require_relative 'fizz_buzz'

(1..100).each do |i|
  puts FizzBuzz.judge(i)
end

# シンプルパターン

# def fizz_buzz(n)
#   if n % (3 * 5) == 0
#     FIZZ + BUZZ
#   elsif n % 3 == 0
#     FIZZ
#   elsif n % 5 == 0
#     BUZZ
#   else
#     n.to_s
#   end
# end
# (1..100).each do |i|
#   puts fizz_buzz(i)
# end
