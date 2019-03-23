class Knight

  attr_accessor :position, :possible_moves
  def initialize (position = ["D",4])
    @position = position
    @possible_moves = possible_moves(position)
  end

  def possible_moves(position)
    moves = [
              [(position[0].ord+2).chr, position[1]+1],
              [(position[0].ord+2).chr, position[1]-1],
              [(position[0].ord+1).chr, position[1]+2],
              [(position[0].ord+1).chr, position[1]-2],
              [(position[0].ord-1).chr, position[1]+2],
              [(position[0].ord-1).chr, position[1]-2],
              [(position[0].ord-2).chr, position[1]+1],
              [(position[0].ord-2).chr, position[1]-1]
            ]

    moves.filter! do |move|
      move[0].ord.between?(65, 72) && move[1].between?(1, 8)
    end

    moves
  end
end

class MoveFinder
  def initialize(start_pos, end_pos)

  end
end

class Board
  attr_accessor :board

  def initialize
    @board = build_board
  end

  def build_board
    new_board = []

    8.times do
      row = []
      8.times do
        row.push(" ")
      end
      new_board.push(row)
    end
    new_board
  end

  def show_board
    board.each do |row|
      puts row.join("|")
    end
    nil
  end
end