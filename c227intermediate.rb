class ContiguousChain
  attr_accessor :grid

  def initialize grid_size, link_percentage
    @grid_size = grid_size
    @link_percentage = link_percentage
    @grid = generate_grid
    @grid_array = @grid.split("\n")
    @chains = []
    @current_coordinates = [0, 0]
    build_chains
  end

  def chain_count
    return @chains.size
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

  def build_chains
    @grid_array.each_with_index do |line, l_index|
      line.split('').each_with_index do |char, c_index|
        if (char == 'x' && line[c_index + 1] == 'x')
          next
        elsif (char == 'x')
          cord = check_chain(Array.[](c_index, l_index))
          if @chains.include?(cord)
            next
          else
            @chains << cord
          end
        else
          next
        end
      end
    end
  end

  def check_chain coordinate_pair
    if coordinate_pair[1] <= (@grid_array.size - 1) &&
       @grid_array[coordinate_pair[1] + 1][coordinate_pair[0]] == 'x'
      return check_from_top(Array.[](coordinate_pair[0], coordinate_pair[1] + 1))
    elsif coordinate_pair[0] <= (@grid_array[0].size - 1) &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] + 1] == 'x'
      return check_from_left(Array.[](coordinate_pair[0] + 1, coordinate_pair[1]))
    elsif coordinate_pair[0] > 0 &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] - 1] == 'x'
      return check_from_right(Array.[](coordinate_pair[0] - 1, coordinate_pair[1]))
    elsif coordinate_pair[1] > 0 &&
          @grid_array[coordinate_pair[1] - 1][coordinate_pair[0]] == 'x'
      return check_from_top(Array.[](coordinate_pair[0], coordinate_pair[1] - 1))
    else
      return coordinate_pair
    end
  end

  def check_from_top coordinate_pair
    if coordinate_pair[1] <= (@grid_array.size - 1) &&
       @grid_array[coordinate_pair[1] + 1][coordinate_pair[0]] == 'x'
      return check_from_top(Array.[](coordinate_pair[0], coordinate_pair[1] + 1))
    elsif coordinate_pair[0] <= (@grid_array[0].size - 1) &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] + 1] == 'x'
      return check_from_left(Array.[](coordinate_pair[0] + 1, coordinate_pair[1]))
    elsif coordinate_pair[0] > 0 &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] - 1] == 'x'
      return check_from_right(Array.[](coordinate_pair[0] - 1, coordinate_pair[1]))
    else
      return coordinate_pair
    end
  end
  
  def check_from_left coordinate_pair
    if coordinate_pair[1] <= (@grid_array.size - 1) &&
       @grid_array[coordinate_pair[1] + 1][coordinate_pair[0]] == 'x'
      return check_from_top(Array.[](coordinate_pair[0], coordinate_pair[1] + 1))
    elsif coordinate_pair[0] <= (@grid_array[0].size - 1) &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] + 1] == 'x'
      return check_from_left(Array.[](coordinate_pair[0] + 1, coordinate_pair[1]))
    elsif coordinate_pair[1] > 0 &&
          @grid_array[coordinate_pair[1] - 1][coordinate_pair[0]] == 'x'
      return check_from_down(Array.[](coordinate_pair[0], coordinate_pair[1] - 1))
    else
      return coordinate_pair
    end
  end
  
  def check_from_right coordinate_pair
    if coordinate_pair[1] <= (@grid_array.size - 1) &&
       @grid_array[coordinate_pair[1] + 1][coordinate_pair[0]] == 'x'
      return check_from_top(Array.[](coordinate_pair[0], coordinate_pair[1] + 1))
    elsif coordinate_pair[0] > 0 &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] - 1] == 'x'
      return check_from_right(Array.[](coordinate_pair[0] - 1, coordinate_pair[1]))
    elsif coordinate_pair[1] > 0 &&
          @grid_array[coordinate_pair[1] - 1][coordinate_pair[0]] == 'x'
      return check_from_down(Array.[](coordinate_pair[0], coordinate_pair[1] - 1))
    else
      return coordinate_pair
    end
  end
  
  def check_from_down coordinate_pair
    if coordinate_pair[1] == @grid_array.size
      return false
    elsif coordinate_pair[0] <= (@grid_array[0].size - 1) &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] + 1] == 'x'
      return check_from_left(Array.[](coordinate_pair[0] + 1, coordinate_pair[1]))
    elsif coordinate_pair[0] > 0 &&
          @grid_array[coordinate_pair[1]][coordinate_pair[0] - 1] == 'x'
      return check_from_right(Array.[](coordinate_pair[0] - 1, coordinate_pair[1]))
    elsif coordinate_pair[1] > 0 &&
          @grid_array[coordinate_pair[1] - 1][coordinate_pair[0]] == 'x'
      return check_from_down(Array.[](coordinate_pair[0], coordinate_pair[1] - 1))
    else
      return Array.[](coordinate_pair[0], coordinate_pair[1])
    end
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
  puts cc.chain_count
end