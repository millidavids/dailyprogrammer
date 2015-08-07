class ConnectFour
  attr_reader :current_player

  def initialize
    @current_player = 'X'
    @board = Array.new(7) { |a| Array.new(6) { |i| '.' } }
    @column_hash = { 'a': @board[0],
                     'b': @board[1],
                     'c': @board[2],
                     'd': @board[3],
                     'e': @board[4],
                     'f': @board[5],
                     'g': @board[6] }
    @end = false
  end

  def play
    while !@end do
      print_board
      valid_space = false
      until valid_space do
        puts @current_player + ', place piece: '
        move = gets.chomp.downcase
        if @column_hash.has_key?(move) && @board[move][6] == '.'
        else
        end
      end
    end
  end

  private

  def print_board
    puts "\n"
    puts '    a b c d e f g'
    @board[0].length.downto(1) do |column|
      print column.to_s + '   '
      @board.length.times do |row|
        print @board[row][column - 1] + ' '
      end
      puts "\n"
    end
    puts "\n"
  end

  def place_piece index
  end
end

if __FILE__ == $0
  board = ConnectFour.new
  board.play
end