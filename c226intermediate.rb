class ConnectFour
  attr_reader :current_player

  def initialize
    @current_player = 'X'
    @board = Array.new(7) { |a| Array.new(6) { |i| '.' } }
    @column_hash = { a: 0,
                     b: 1,
                     c: 2,
                     d: 3,
                     e: 4,
                     f: 5,
                     g: 6 }
    @end = false
  end

  def play
    until winner do
      print_board
      valid_space = false
      until valid_space do
        print @current_player + ', place piece: '
        move = gets.chomp.downcase
        if @column_hash.has_key?(move.to_sym) &&
           @board[@column_hash[move.to_sym]][5] == '.'
          valid_space = true
          place_piece @column_hash[move.to_sym]
          if winner
            return winner
          end
          if @current_player == 'X'
            @current_player= 'O'
          else
            @current_player = 'X'
          end
        else
          puts "Not a valid play. Try again.\n\n"
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

  def place_piece column
    @board[column].each_with_index do |space, index| 
      if space == '.'
        @board[column][index] = @current_player
        break
      else
        next
      end
    end
  end

  def winner
    false
  end
end

if __FILE__ == $0
  board = ConnectFour.new
  board.play
end