__author__ = 'davidyurek'
__question__ = 'Your program will be given an ASCII art chart showing boxes and lines. - and | characters indicate horizontal and vertical lines, respectively, while "+" characters show intersections.
Your program should emit an integer, N, of how many unique four sided figures it found. Rectangles and squares both count.'

def get_squares file_name
  text = File.open(file_name).each do |line|
    if line.index('+')
      pluses = (0..line.length).find_all { |i| line[i, 1] == '+'}
      potential_top_edge_pairs = top_edge_pairs pluses
      for pair in potential_top_edge_pairs do
        if /[+](-+)[+]/.match(line[pair[0]..pair[1]])
          print true
        end
      end
    else
      puts "\n"
    end
  end
end

def top_edge_pairs array
  pairs = []
  if array.length < 2
    pairs
  elsif array.length == 2
    pairs << array
  else
    for i in 2..array.length do
      pairs << [array[0], array[i - 1]]
    end
    array.shift
    pairs += top_edge_pairs(array)
  end
end

if __FILE__ == $0
  file_name = './res/3977boxes.txt'
  get_squares(file_name)
  n = 0
end