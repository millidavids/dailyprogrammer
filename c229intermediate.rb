class ReverseFizzBuzz
  def initialize input
    line_array = input.split("\n").map(&:strip)
    @letter_number_hash = Hash.new
    initial_hash(line_array)
    
  end

  private

  def initial_hash line_array
    line_array.each do |line|
      line.split('').each do |char|
        @letter_number_hash[char] = 1 unless @letter_number_hash.has_key?(char)
      end
    end
  end
end

if __FILE__ == $0
  input = $stdin.read
  rfb = ReverseFizzBuzz.new(input)
end