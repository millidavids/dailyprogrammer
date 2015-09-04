class ReverseFizzBuzz
  def self.reversify input
    line_array = input.split("\n").map(&:strip)
    letter_number_hash = Hash.new
  end

  private
end

if __FILE__ == $0
  input = $stdin.read
  puts ReverseFizzBuzz.reversify(input)
end