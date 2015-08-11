class SquareSpiral
  attr_reader :size

  def initialize grid_size
    @size = grid_size
  end

  def print_grid
    print "\n"
    @size.times do
      @size.times do
        print 'X '
      end
      print "\b\n\n"
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