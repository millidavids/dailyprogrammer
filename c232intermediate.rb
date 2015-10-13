class GrandmasHouse
  def initialize n_coordinates, coordinates_pairs
    puts n_coordinates
    puts coordinates_pairs.to_s
  end
end

if __FILE__ == $0
  input = $stdin.read.split("\n")
  gh = GrandmasHouse.new(input[0], input[1..input.size])
end