# frozen_string_literal: true

module LuhnValidator # rubocop:disable Style/Documentation
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    test = nums_a.pop
    test_result = calculate_test_result(nums_a)
    (10 - (calculate_sum(test_result) % 10)) % 10 == test
  end

  def calculate_test_result(nums_a)
    nums_a.reverse.each_with_index.map { |num, index| (index + 1).odd? ? num * 2 : num }
  end

  def calculate_sum(test_result)
    test_result.reduce(0) { |acc, num| acc + (num > 9 ? num - 9 : num) }
  end
end
