__challenge__ = "Convert a maze into a diagonal maze."

class DiagonalMaze

  def initialize string
    line_array = string.split("\n")
    width = line_array[0].length
    height = line_array.length
    puts width
    puts height
  end
end

if __FILE__ == $0
  maze = DiagonalMaze.new($stdin.read)
end