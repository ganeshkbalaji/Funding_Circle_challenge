require 'rspec'
require_relative 'number_multiplier_prime'

describe 'NumberMultiplierPrime' do

  let(:multiplier) { NumberMultiplierPrime.new }

  it 'contains prime numbers across the top' do
    expect(multiplier.top_row) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  it 'contains prime numbers in the left column' do
    expect(multiplier.left_column) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  it 'knows the output' do
    expect(multiplier.output) == [
      [4, 6, 10, 14, 22, 26, 34, 38, 46, 58],
      [6, 9, 15, 21, 33, 39, 51, 57, 69, 87],
      [10, 15, 25, 35, 55, 65, 85, 95, 115, 145],
      [14, 21, 35, 49, 77, 91, 119, 133, 161, 203],
      [22, 33, 55, 77, 121, 143, 187, 209, 253, 319],
      [26, 39, 65, 91, 143, 169, 221, 247, 299, 377],
      [34, 51, 85, 119, 187, 221, 289, 323, 391, 493],
      [38, 57, 95, 133, 209, 247, 323, 361, 437, 551],
      [46, 69, 115, 161, 253, 299, 391, 437, 529, 667],
      [58, 87, 145, 203, 319, 377, 493, 551, 667, 841]
    ]
  end

  describe 'printing' do

    it 'prints the top row' do
      expect(multiplier.print_top_row!) == "   |  2  3   5   7  11  13  17  19  23  29"
    end

    it 'prints a divider row of the correct length' do
      expect(multiplier.print_divider_row!) == "------------------------------------------"
    end
  end
end
