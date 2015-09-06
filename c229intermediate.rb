class ReverseFizzBuzz
  def initialize input
    line_array = input.split("\n").map(&:strip)
    @frequencies = Hash.new
    @letter_number_values_pairs = []
    initial_data(line_array)
    puts @letter_number_values_pairs.to_s
    puts @frequencies.to_s
  end

  private

  def initial_data line_array
    line_array.each do |line|
      line.split('').each do |char|
        unless @letter_number_values_pairs.any? { |e| e[0] == char }
          @letter_number_values_pairs << [char, 1]
          @frequencies[char] = 1
        else
          @frequencies[char] += 1
        end 
      end
    end
    @letter_number_values_pairs.sort_by! { |x| @frequencies[x[0]] }.reverse!
  end
end

if __FILE__ == $0
  input = $stdin.read
  rfb = ReverseFizzBuzz.new(input)
end