module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum(number)
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    test = nums_a.pop
    test_result = nums_a.each_with_index.map do |num, index|
      index.odd? ? num * 2 : num
    end
    sum = test_result.reduce(0) { |acc, num| acc + (num > 9 ? num - 9 : num) }
    10 - (sum % 10) == test
  end
end

# number = "79927398713"
# nums_a = number.to_s.chars.map(&:to_i)
# test = nums_a.pop
# test_result = nums_a.each_with_index.map do |num, index|
#   index.odd? ? num * 2 : num
# end
# puts test_result
# sum = test_result.reduce(0) { |acc, num| acc + (num > 9 ? num - 9 : num) }
# puts sum
# puts 10 - (sum % 10) == test
