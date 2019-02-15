require_relative 'board'
require_relative 'player'

class Game
  attr_reader :current_player, :next_player, :board
  def initialize(**opts)
    @current_player = opts[:current_player]
    @next_player    = opts[:next_player]
    @board          = opts[:board]
    @game_state     = ''
  end

  def play
    board.show()
    while true
      puts "#{current_player.name}, place your #{current_player.mark}:"
      game_state = board.update(current_player.mark, gets.chomp.to_i)
      case game_state
        when 'win'
          puts "#{current_player.name} wins!"
          break
        when 'draw'
          puts "It's a Draw"
          break
        when 'in progress'
          switch_players()
      end
    end
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end
end

g = Game.new(
  current_player: Player.new,
  next_player: Player.new,
  board: Board.new
).play