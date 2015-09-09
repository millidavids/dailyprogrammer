class ReverseFizzBuzz
  def initialize input
    @line_array = input.split("\n").map(&:strip)
    @frequencies = Hash.new
    @pairs = []
    @ratios = []
    initial_data
    puts @frequencies.to_s
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
    build_ratios
    0..(@pairs.length - 1).times do |index|
      @pairs[index + 1][1] = @pairs[index][1] * @ratios[index][0]
    end
    @pairs.sort_by! { |x| @frequencies[x[0]] }.reverse!
    find_missing_letters
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

  def find_missing_letters
    last_letter = @frequencies.keys.sort.last
    (97..last_letter.ord).each do |ascii_value|
      unless @frequencies.has_key?(ascii_value.chr)
        @frequencies[ascii_value.chr] = 0
        @pairs << [ascii_value.chr, '-']
      end
    end
  end
end

if __FILE__ == $0
  input = $stdin.read.downcase
  rfb = ReverseFizzBuzz.new(input)
end