class ConnectFour
  attr_reader :current_player

  def initialize
    @current_player = 'X'
    @board_array = Array.new(7) { |a| Array.new(6) { |i| '.' } }
  end

  def play
    print_board
  end

  private

  def print_board
    puts "\n"
    puts '    a b c d e f g'
    @board_array[0].length.downto(1) do |column|
      print column.to_s + '   '
      @board_array.length.times do |row|
        print @board_array[row][column - 1] + ' '
      end
      puts "\n"
    end
    puts "\n"
  end
end

if __FILE__ == $0
  board = ConnectFour.new
  board.play
end