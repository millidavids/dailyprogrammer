class GrandmasHouse
  attr_reader :n_pairs, :closest_pairs

  def initialize n_pairs, coordinates_pairs
    @n_pairs = n_pairs
    @coordinates_pairs = coordinates_pairs
  end
end

if __FILE__ == $0
  input = $stdin.read.split("\n")
  gh = GrandmasHouse.new(input[0], input[1..input.size])
end