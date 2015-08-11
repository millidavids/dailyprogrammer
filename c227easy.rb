class SquareSpiral
  def initialize grid_size
  end
end

if __FILE__ == $0
  print "Size of grid (odd): "
  size = gets.chomp.to_i

  until (size % 2) == 1 do
    print "#{size} is not odd, try again: "
    size = gets.chomp.to_i
  end
end