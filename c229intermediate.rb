class ReverseFizzBuzz
  def initialize input
    line_array = input.split("\n").map(&:strip)
    @letter_number_values = Hash.new
    @letter_frequency = Hash.new
    initial_data(line_array)
    puts @letter_frequency.to_s
    puts @letter_number_values.to_s
  end

  private

  def initial_data line_array
    line_array.each do |line|
      line.split('').each do |char|
        unless @letter_number_values.has_key?(char)
          @letter_number_values[char], @letter_frequency[char] = 1, 1
        else
          @letter_frequency[char] += 1
        end 
      end
    end
  end
end

if __FILE__ == $0
  input = $stdin.read
  rfb = ReverseFizzBuzz.new(input)
end