class ConnectFour
  attr_reader :current_player

  def initialize
    @current_player = 'X'
  end

  def play
  end
end

if __FILE__ == $0
  ConnectFour.new
end