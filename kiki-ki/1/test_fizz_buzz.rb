require 'test/unit'
require_relative 'fizz_buzz'

class TestFizzBuzz < Test::Unit::TestCase
  def test_judge_fizz
    assert_equal FizzBuzz::FIZZ, FizzBuzz.judge(3)
  end

  def test_judge_buzz
    assert_equal FizzBuzz::BUZZ, FizzBuzz.judge(5)
  end

  def test_judge_fizz_buzz
    assert_equal FizzBuzz::FIZZ + FizzBuzz::BUZZ, FizzBuzz.judge(15)
  end

  def test_judge_neither_fizz_nor_buzz
    n = 1
    assert_equal 1.to_s, FizzBuzz.judge(n)
  end
end
