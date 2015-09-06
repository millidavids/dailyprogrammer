class ReverseFizzBuzz
  def initialize input
    @line_array = input.split("\n").map(&:strip)
    @frequencies = Hash.new
    @pairs = []
    @ratios = []
    initial_data
    build_ratios
    puts @pairs.to_s
    puts @frequencies.to_s
    puts @ratios.to_s
  end

  private

  def initial_data
    @line_array.each do |line|
      line.split('').each do |char|
        unless @pairs.any? { |e| e[0] == char }
          @pairs << [char, 1]
          @frequencies[char] = 1
        else
          @frequencies[char] += 1
        end 
      end
    end
    @pairs.sort_by! { |x| @frequencies[x[0]] }.reverse!
  end

  def build_ratios
    @pairs[0..(@pairs.length - 2)].each_with_index do |first_pair, first_index|
      line_ratios = []
      @pairs[first_index+1..@pairs.length].each_with_index do |second_pair, second_index|
        ratio_value = 0
        @line_array.each do |line|
          if line.include?(second_pair[0]) && line.include?(first_pair[0])
            ratio_value += 1
            break
          elsif line.include?(second_pair[0])
            break
          elsif line.include?(first_pair[0])
            ratio_value += 1
          else
            next
          end
        end
        line_ratios << ratio_value
      end
      @ratios << line_ratios
    end
  end
end

if __FILE__ == $0
  input = $stdin.read
  rfb = ReverseFizzBuzz.new(input)
end