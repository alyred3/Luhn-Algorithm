module Luhn
  def self.is_valid?(number)
    numbers = number.to_s.chars.map(&:to_i)
    check_sum = numbers.pop

    sum = numbers.reverse.each_slice(2).flat_map do |x,y|
        [(x*2).divmod(10), y || 0]
      end.flatten.inject(:+)

check_sum.zero? ? sum % 10 == 0 : (10 - sum % 10) == check_sum
  end
end

Luhn.is_valid? "4194560385008504"
Luhn.is_valid? "4194560385008505"
