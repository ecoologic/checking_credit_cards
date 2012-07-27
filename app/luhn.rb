# Luhn validation for credit cards
# also see: https://github.com/rolfb/luhn-ruby
module Luhn

  # call this method to check the credit card number
  def valid_luhn?(number)
    doubled = luhn_double number

    sum = luhn_sum doubled

    # 3. if that total is a multiple of 10, the number is valid
    (sum % 10) == 0
  end

  # 1. Starting with the next to last digit and continuing with every other digit
  # going back to the beginning of the card, double the digit
  def luhn_double(number)
    number_to_ary(number).reverse.map.with_index do |n, i|
      i.even? ? n : n*2
    end.reverse  
  end

  # 2. Sum all doubled and untouched digits in the number
  # For digits greater than 9 you will need to split them and sum them independently
  # (i.e. "10", 1 + 0).
  def luhn_sum(numbers)
    numbers.map(&method(:number_to_ary)).flatten.
            inject(0) {|sum, n| sum + n}
  end

  def number_to_ary(number)
    number.to_s.split('').map(&:to_i)
  end

end
