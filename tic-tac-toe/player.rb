class Player  
  attr_reader :name, :mark
  @@players = 0

  def initialize
    @name     = set_name
    @mark     = set_mark
    @@players += 1
  end

  private

  def set_name
    puts "Enter your name: "
    name = gets.chomp
  end

  def self.count_players
    @@players
  end

  def set_mark
    @@players<1 ? "X" : "O"
  end
end