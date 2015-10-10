class SetGame
  attr_reader :list, :sets, :set_size

  def initialize input_array, sets_of
    @list = input_array
    @set_size = sets_of
    @sets = get_sets
  end

  private

  def get_sets
    return @list.combination(set_size).to_a.select{ |e| valid_set(e) }
  end

  def valid_set items
    items[0].length.times do |i|
      unique_letters = items.map{ |f| f[i] }.uniq.length
      return false if unique_letters > 1 && unique_letters < @set_size
    end
    return true
  end
end

if __FILE__ == $0
  input = $stdin.read.split("\n")
  sg = SetGame.new(input, 3)
  puts sg.sets.to_s
end