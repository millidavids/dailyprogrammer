__author__ = 'davidyurek'
__question__ = 'Your program will be given an ASCII art chart showing boxes and lines. - and | characters indicate horizontal and vertical lines, respectively, while "+" characters show intersections.
Your program should emit an integer, N, of how many unique four sided figures it found. Rectangles and squares both count.'

class DetectFourSidedFigures
  attr_reader :N, :filename

  def initialize filename
    @N = 0
    @filename = filename
    @current_line_index = 0
    File.foreach(@filename).each do |line|
      @current_line_index += 1
      find_squares_per_line line
    end
  end

  private

  def find_squares_per_line line
    if line.include?('+')
      pluses = (0..line.length).find_all { |i| line[i, 1] == '+'}
      potential_top_edge_pairs = top_edge_pairs_list pluses
      valid_pairs = connected_top_edge_pairs potential_top_edge_pairs, line
      for pair in valid_pairs do
        read_file_for_completed_squares pair
      end
    end
  end

  def top_edge_pairs_list pluses
    pairs = []
    if pluses.length < 2
      pairs
    elsif pluses.length == 2
      pairs << pluses
    else
      for i in 2..pluses.length do
        pairs << [pluses[0], pluses[i - 1]]
      end
      pluses.shift
      pairs += top_edge_pairs_list(pluses)
    end
  end

  def connected_top_edge_pairs potential_top_edge_pairs, line
    connected_pairs = []
    for pair in potential_top_edge_pairs do
      if valid_x_edge(line[pair[0]..pair[1]])
        connected_pairs << pair
      end
    end
  end

  def valid_x_edge string
    string.each_byte do |ascii|
      return false unless ascii.chr == '+' || ascii.chr == '-'
    end
    true
  end

  def read_file_for_completed_squares pair
    count_down = @current_line_index
    File.foreach(@filename).each do |line|
      if count_down > 0
        count_down -= 1
        next
      elsif line[pair[0]] == '+' &&
            line[pair[1]] == '+' && 
            valid_x_edge(line[pair[0]..pair[1]])
        @N += 1
      elsif (line[pair[0]] == '|' || line[pair[0]] == '+') &&
            (line[pair[1]] == '|' || line[pair[1]] == '+')
        next
      else
        break
      end
    end
  end
end

if __FILE__ == $0
  filename = './res/3977boxes.txt'
  dfsf = DetectFourSidedFigures.new(filename)
  puts dfsf.filename + ': ' + dfsf.N.to_s
end