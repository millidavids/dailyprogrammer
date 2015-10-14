class GrandmasHouse
  attr_reader :n_pairs

  def initialize n_pairs, coordinate_pairs
    @n_pairs = n_pairs
    @coordinate_pairs = coordinate_pairs.map{ |p| p.gsub(/[\(\)\s]/, '').split(',').map(&:to_f) }
  end

  def closest_pair
    pair = [[@coordinate_pairs[0]], [@coordinate_pairs[1]]]
    min_distance = distance(@coordinate_pairs[0], @coordinate_pairs[1])
    @coordinate_pairs.size.times do |f_i|
      next if f_i >= @coordinate_pairs.size - 1
      ((f_i + 1)..(@coordinate_pairs.size - 1)).each do |s_i|
        next if s_i == 1
        if (distance(@coordinate_pairs[f_i], @coordinate_pairs[s_i]) < min_distance)
          pair[0], pair[1] = @coordinate_pairs[f_i], @coordinate_pairs[s_i]
        end
      end
    end
    return pair
  end

  private

  def distance first_pair, second_pair
    Math.sqrt((first_pair[0] - second_pair[0])**2 + (first_pair[1] - second_pair[1])**2)
  end
end

if __FILE__ == $0
  input = $stdin.read.split("\n")
  gh = GrandmasHouse.new(input[0], input[1..input.size])
  puts gh.closest_pair.to_s
end