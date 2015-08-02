__challenge__ = "Convert a maze into a diagonal maze."

class DiagonalMaze

  def initialize string
    no_pluses = string.gsub('+', ' ')
  end
end

if __FILE__ == $0
  maze = DiagonalMaze.new($stdin.read)
end