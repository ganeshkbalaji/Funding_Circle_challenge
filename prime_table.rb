require 'matrix'

class PrimeMultiplicationTable
  #determine if a number is prime by testing it against all known
  #primes to see if it is evenly divisable by one of them
  def is_prime_num(num, prime_numbers)
    sqrt = Math.sqrt(num).ceil
    for prime in prime_numbers
      break if prime > sqrt
      return false if num % prime == 0
    end
    return true
  end

  #returns a list of given input size of prime numers
  def prime_list(number_of_primes)
    return [] if number_of_primes < 1
    prime_numbers = Array.new
    for num in 2..9999999 do
      if is_prime_num(num, prime_numbers)
        prime_numbers.push(num)
        break if prime_numbers.length == number_of_primes
      end
    end
    return prime_numbers
  end

  #print a formatted table from a matrix
  def pretty_print(table)
    max_digits = table.row(table.row_size-1)[table.column_size-1].to_s.size + 1
    for row in 0..table.row_size-1 do
      table.row(row).each do |value|
        if value != 1
          printf("%#{max_digits}d", value) ;
        else
          printf("%#{max_digits}c", " ") ;
        end
      end
      puts ""
    end
  end

  #returns a matrix representation of the first n prime numbers's multiplications table
  def prime_multiplication_table(number_of_primes)
    #add 1 to primes to accomidate empty cell in table
    prime_numbers = [1] + prime_list(number_of_primes)
    multiplication_table = Matrix.build(number_of_primes+1, number_of_primes+1) {|i, j| prime_numbers[i]*prime_numbers[j] }
    return multiplication_table
  end

  #print a table showing the multiplication table of the first n prime numbers
  def print_prime_multiplication_table(number_of_primes)
    multiplication_table = prime_multiplication_table(number_of_primes)
    pretty_print(multiplication_table)
  end
end

#how to print the multiplication table
# pmt = PrimeMultiplicationTable.new
# pmt.print_prime_multiplication_table(2)