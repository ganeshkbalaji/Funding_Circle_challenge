
class NumberMultiplierPrime

  attr_reader :top_row, :left_column, :output

  def initialize(x=10, y=10)
    @top_row = primes_generator.take x.to_i
    @left_column = primes_generator.take y.to_i
    @output = @left_column.reduce([]) {|output, multiplier|
      output << @top_row.map {|value| multiplier * value }
    }
  end

  def left_column_width
    @left_column.max.to_s.length
  end

  def column_widths
    @output.transpose.map {|column| column.max.to_s.length }
  end

  def print_contents! contents
    string = ''
    contents.each_with_index {|value, index|
      string += value.to_s.rjust(column_widths[index] + 1)
    }
    string
  end

  def print_top_row!
    ''.rjust(left_column_width) + " |" + print_contents!(@top_row)
  end

  def print_divider_row!
    print_top_row!.gsub(/./, '-')
  end

  def print_row!(row_number)
    @left_column[row_number].to_s.rjust(left_column_width) +
    " |" +
    print_contents!(@output[row_number])
  end

  def print_output!
    lines = [print_top_row!, print_divider_row!]
    @left_column.each_with_index {|multiplier, row|
      lines << print_row!(row)
    }
    lines.join("\n")
  end

private
  def primes_generator(n = 10)
    primes = []
    counter = 2
    while primes.length < n do
      primes << (counter) if is_prime?(counter)
      counter += 1
    end
    primes
  end

  def is_prime?(test_num)
    (2..test_num/2).each do |num|
      return false if test_num % num == 0
    end
    true
  end
end

puts NumberMultiplierPrime.new.print_output!