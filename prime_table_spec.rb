require './prime_multiplication_table'
require 'matrix'

describe PrimeMultiplicationTable do
  it "returns a list of n prime numbers" do
    pmt = PrimeMultiplicationTable.new
    expect(pmt.prime_list(0)).to eq([])
    expect(pmt.prime_list(1)).to eq([2])
    expect(pmt.prime_list(2)).to eq([2,3])
    expect(pmt.prime_list(10)).to eq([2,3,5,7,11,13,17,19,23,29])
  end

  it "determines if a number is prime" do
    pmt = PrimeMultiplicationTable.new
    expect(pmt.is_prime_num(2, [])).to eq(true)
    expect(pmt.is_prime_num(3, [2])).to eq(true)
    expect(pmt.is_prime_num(4, [2])).to eq(false)
    expect(pmt.is_prime_num(5, [2,3])).to eq(true)
    expect(pmt.is_prime_num(9, [2,3,5,7])).to eq(false)
  end

  it "builds a matrix representation of the prime multiplcation table" do
    pmt = PrimeMultiplicationTable.new
    expect(pmt.prime_multiplication_table(0)).to eq(Matrix[[1]])
    expect(pmt.prime_multiplication_table(1)).to eq(Matrix[[1, 2], [2, 4]])
    expect(pmt.prime_multiplication_table(2)).to eq(Matrix[[1, 2, 3], [2, 4, 6], [3, 6, 9]])
  end
end