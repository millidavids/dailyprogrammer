class SquareSpiral
  attr_reader :size, :spiral_array

  def initialize grid_size
    @size = grid_size
    @spiral_array = []
    build_spiral_array
  end

  def print_grid
    cell_size = @spiral_array.length.to_s.length
    1.upto(@size) do |y|
      1.upto(@size) do |x|
        position = @spiral_array.index([x, y])
        print position + 1
        (cell_size - (position + 1).to_s.length + 1).times { print ' ' }
      end
      puts "\b\n"
    end
  end

  private

  def center_pair
    Array.new(2) { @size / 2 + 1 }
  end

  def build_spiral_array
    shifter = 1
    current_coordinates = center_pair
    @spiral_array.push(Array.new(current_coordinates))
    1.upto(@size) do |i|
      if shifter < @size
        i.times do
          current_coordinates[0] += shifter
          @spiral_array.push(Array.new(current_coordinates))
        end
        i.times do
          current_coordinates[1] -= shifter
          @spiral_array.push(Array.new(current_coordinates))
        end
      else
        (i - 1).times do
          current_coordinates[0] += shifter
          @spiral_array.push(Array.new(current_coordinates))
        end
      end
      shifter *= -1
    end
  end
end

if __FILE__ == $0
  print "Size of grid (odd): "
  size = gets.chomp.to_i

  until (size % 2) == 1 do
    print "#{size} is not odd, try again: "
    size = gets.chomp.to_i
  end

  spiral = SquareSpiral.new(size)
  spiral.print_grid
end