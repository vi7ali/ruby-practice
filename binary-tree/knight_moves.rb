class Knight
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
    
  end
end