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
    @move = 'a'.to_sym
    @row = 0
  end

  def play
    until false do
      print_board
      valid_space = false
      until valid_space do
        print @current_player + ', place piece: '
        @move = gets.chomp.downcase.to_sym
        if @column_hash.has_key?(@move) &&
           @board[@column_hash[@move]][5] == '.'
          valid_space = true
          @row = place_piece @column_hash[@move]
          if winner
            print_board
            return winner + ' wins!'
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
        return index
      else
        next
      end
    end
  end

  def winner
    return @current_player if check_horizontal ||
                              check_vertical ||
                              check_positive_diagonal ||
                              check_negative_diagonal
    false
  end

  def check_horizontal
    streak = 1
    @column_hash[@move] < 6 ? iterator = 1 : iterator = -1
    until !@board[@column_hash[@move] + iterator].nil? ||
          @board[@column_hash[@move] + iterator][@row] != @current_player
      streak += 1
      iterator += iterator > 0 ? 1 : -1
      return true if streak == 4
    end
    if iterator > 0 
      iterator = -1
      until @board[@column_hash[@move] + iterator].nil? ||
        @board[@column_hash[@move] + iterator][@row] != @current_player
        streak += 1
        iterator += -1
        return true if streak == 4
      end
    end
    false
  end

  def check_vertical
    streak = 1
    @row < 5 ? iterator = 1 : iterator = -1
    until @board[@column_hash[@move]][@row + iterator].nil? ||
          @board[@column_hash[@move]][@row + iterator] != @current_player
      streak += 1
      iterator += iterator > 0 ? 1 : -1
      return true if streak == 4
    end
    if iterator > 0 
      iterator = -1
      until @board[@column_hash[@move]][@row + iterator].nil? ||
        @board[@column_hash[@move]][@row + iterator] != @current_player
        streak += 1
        iterator += -1
        return true if streak == 4
      end
    end
    false
  end

  def check_positive_diagonal
    streak = 1
    (@row < 5 && @column_hash[@move] < 6) ? iterator = 1 : iterator = -1
    until @board[@column_hash[@move] + iterator][@row + iterator].nil? ||
          @board[@column_hash[@move] + iterator][@row + iterator] != @current_player
      streak += 1
      iterator += iterator > 0 ? 1 : -1
      return true if streak == 4
    end
    if iterator > 0 
      iterator = -1
      until @board[@column_hash[@move] + iterator][@row + iterator].nil? ||
        @board[@column_hash[@move] + iterator][@row + iterator] != @current_player
        streak += 1
        iterator += -1
        return true if streak == 4
      end
    end
    false
  end

  def check_negative_diagonal
    streak = 1
    (@row < 5 && @column_hash[@move] < 6) ? iterator = 1 : iterator = -1
    until @board[@column_hash[@move] + iterator][@row - iterator].nil? ||
          @board[@column_hash[@move] + iterator][@row - iterator] != @current_player
      streak += 1
      iterator += iterator > 0 ? 1 : -1
      return true if streak == 4
    end
    if iterator > 0 
      iterator = -1
      until @board[@column_hash[@move] - iterator][@row + iterator].nil? ||
        @board[@column_hash[@move] - iterator][@row + iterator] != @current_player
        streak += 1
        iterator += -1
        return true if streak == 4
      end
    end
    false
  end
end

if __FILE__ == $0
  board = ConnectFour.new
  puts board.play
end