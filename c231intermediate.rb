class SetGame
  def initialize input_array
    @list = input_array
  end

  def get_sets
  end
end

if __FILE__ == $0
  input = $stdin.read.split("\n")
  sg = SetGame.new(input)
end