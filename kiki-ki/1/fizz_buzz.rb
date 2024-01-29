class FizzBuzz
  FIZZ = "Fizz".freeze
  BUZZ = "Buzz".freeze

  def self.judge(n)
    if n % (3 * 5) == 0
      FIZZ + BUZZ
    elsif n % 3 == 0
      FIZZ
    elsif n % 5 == 0
      BUZZ
    else
      n.to_s
    end
  end
end
