class Word
  attr_reader :word, :fd

  def initialize
    @fd = "5desk.txt"
    @word = random_word
  end

  private

  def random_word    
    while true
      random_word = all_words[rand(all_words.length-1)].upcase
      break if random_word.length.between?(5,12)
    end
    random_word
  end

  def all_words
    lines = File.open(fd, "r") {|file| file.readlines}
    lines.map!{|line| line.strip}
  end
end