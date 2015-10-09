class SetGame
  attr_reader :list, :sets
  def initialize input_array, sets_of
    @list = input_array
    @sets = get_sets(input_array, 3)
  end

  private

  def get_sets array, sets_of
    sets = []
    if sets_of == 1
      array.each_with_index do |i|
      end
    end
  end

  def all_equal
  end

  def all_different
  end
end

if __FILE__ == $0
  input = $stdin.read.split("\n")
  sg = SetGame.new(input, 3)
end