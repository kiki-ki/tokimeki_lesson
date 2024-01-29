
total = 0

for i in (1..100) do
    total = total + i
end

puts total

(1..100).each do |i|

    if i % 15 == 0
        puts "FizzBuzz"
    elsif i % 3 == 0
        puts "Fizz"
    elsif i % 5 == 0
        puts "Buzz"
    else
        puts i
    end

    
end