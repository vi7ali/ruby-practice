class Board
  attr_reader :grid

  WINNERS = [[1,2,3], [4,5,6], [7,8,9],
             [1,4,7], [2,5,8], [3,6,9],
             [1,5,9], [3,5,7]]

  def initialize
    @grid = Array.new(10) {|i| i}
    @grid[0] = '*'
  end

  def show
    puts <<-GRID
       #{grid[1]} | #{grid[2]} | #{grid[3]}
      ---+---+---
       #{grid[4]} | #{grid[5]} | #{grid[6]}
      ---+---+---
       #{grid[7]} | #{grid[8]} | #{grid[9]}
    GRID
  end

  def update(mark, place)
    if validate(mark, place)
      grid[place] = mark.upcase
      show()
      return check_for_win(mark)
    end
    return 'try again'
  end

  def validate(mark, place)
    if place < 1 || place > 9
      puts 'Please provide a valid cell number from 1 to 9'
    elsif !grid[place].is_a?(Integer)
      puts 'Place already occupied'
    else
      return true
    end
    return false
  end

  def check_for_win(mark)
    return 'draw' if !grid.any?(Integer)
    WINNERS.each do |win|
      return 'win' if win.select{|i| grid[i] == mark}.count == 3
    end
    return 'in progress'
  end
end