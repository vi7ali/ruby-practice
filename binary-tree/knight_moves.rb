class Knight

  attr_accessor :position, :possible_moves, :previous_knight

  def initialize (position, previous_knight=nil)
    @position = position
    @possible_moves = get_moves(position)
    @previous_knight = previous_knight
  end

  def get_moves(position)
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

  def moves_history
    moves = []
    local_previous = previous_knight
    while local_previous != nil
      moves.push(local_previous.position)
      local_previous = local_previous.previous_knight
    end    
    moves.reverse!
    moves.push(position)
  end
end

class MoveFinder

  attr_accessor :knight, :end_pos, :moves_set, :start_pos

  def initialize(start_pos = ["D", 4], end_pos)
    @start_pos = start_pos
    @knight = create_knight(start_pos, nil)
    @end_pos = end_pos
    @moves_set = find_moves
  end

  def create_knight(position, previous_knight)
    Knight.new(position, previous_knight)
  end

  def find_moves
    queue = []
    queue.push(knight)

    while !queue.empty?
      if queue[0].position == end_pos
        break
      else
        queue[0].possible_moves.each do |move|
          queue.push(create_knight(move, queue[0]))
        end
        queue.shift
      end
    end

    moves = queue[0].moves_history
    puts "It takes #{moves.length - 1} moves to move from #{start_pos} to #{end_pos} \n"
    
    moves.each do |move|
      puts "#{move}"
    end

  end  
end