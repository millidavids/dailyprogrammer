class ContiguousChain
  attr_accessor :grid

  def initialize grid_size, link_percentage
    @grid_size = grid_size
    @link_percentage = link_percentage
    @grid = generate_grid
  end

  private

  def generate_grid
    grid = ''
    @grid_size[1].times do
      @grid_size[0].times do
        grid << ((rand(100) < @link_percentage) ? 'x' : ' ')
      end
      grid << "\n"
    end
    return grid
  end

  def grid_array
  end
end

def elements_greater_than_zero array
  array.map do |element|
    if element <= 0
      return false
    else
      next
    end
  end
  return true
end

if __FILE__ == $0
  print 'Enter grid coordinate size pair, x first then y, space separated: '
  coordinate_string = gets.chomp.strip
  grid_size = coordinate_string.strip.split(' ').map { |int| int.to_i }
  until /^\d+ \d+$/.match(coordinate_string) && elements_greater_than_zero(grid_size) do
    print 'Not valid coordinates, try again: '
    coordinate_string = gets.chomp
    grid_size = coordinate_string.strip.split(' ').map { |int| int.to_i }
  end

  print "\nEnter chain link appearance percentage (number only): "
  link_percentage = gets.chomp.strip
  until /^\d+$/.match(link_percentage) && link_percentage.to_i <= 100
    print 'Not a valid percentage value, try again: '    
    link_percentage = gets.chomp.strip
  end

  cc = ContiguousChain.new(grid_size, link_percentage.to_i)
  puts cc.grid
end