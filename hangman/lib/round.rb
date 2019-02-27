require_relative "word"
require "json"

class Round

  attr_accessor :attempts, :hidden_word, :generated_word, :wrong_guesses

  def initialize(opts)
    #setting the variables in a separate method for the save/load feature to work
    set_instance_variables(opts)
  end

  def set_instance_variables(opts)
    @generated_word = opts[:generated_word] || self.generated_word
    @attempts = opts[:attempts] || 12
    @hidden_word = opts[:hidden_word] || generated_word.gsub(/./, "_")
    @wrong_guesses = opts[:wrong_guesses] || []
  end

  def to_json
    {
      attempts: attempts,      
      generated_word: generated_word,
      hidden_word: hidden_word,
      wrong_guesses: wrong_guesses
    }.to_json
  end
  
  def play
    puts "Would you like to load an existing game?(y/n)"
    save_load(3) if get_input == "y"
    while attempts > 0
      show_display
      input = get_input.upcase
      update_game_status(input)
      if check_status == "win"
        puts "Congratulations, You win!!!"
        break
      elsif check_status == "lose"
        puts "You lose, the word was #{generated_word}"
      end
    end
  end

  def show_display
    #Formatting and storing 'hidden word' and 'wrong_guesses' into strings
    #for readibility purposes to use in heredoc "DISP"
    formatted_hw = hidden_word.split('').join(" ")
    formatted_wg = wrong_guesses.join(" ")
    
    display = <<~DISP
      Hello, let's play a game!
      You've got #{attempts} out of 12 attempts to guess the word.

      The word is: #{formatted_hw}

      *******************************
      WRONG GUESSES: #{formatted_wg}
      *******************************
      Would you like to take a guess, try to answer(1), save a game(2)? or load a game(3)
    DISP
    system("clear")
    puts display
  end

  def get_input    
    input = gets.chomp
    if input.length == 1
      return input
    else
      puts "Invalid input, please try again"
      get_input
    end
  end

  def check_status
    if (attempts==0 && hidden_word.include?("_"))
      return "lose"
    elsif !hidden_word.include?("_")
      return "win"
    end
  end

  def update_game_status(input)
    case input
    when "1"      
      puts "Please type the word below"
      guessed_word = gets.chomp.strip.upcase
      self.attempts = 0
      self.hidden_word = guessed_word if generated_word == guessed_word      
    when "2", "3"
      save_load(input)
    else
      #On a successfull guess
      #create an array containing all the indexes that match the input
      #and all the occurences of the input are assigned to the hidden word string
      if generated_word.include?(input)      
        array_of_matched_indexes = (0...generated_word.length).find_all{|i| generated_word[i] == input}
        array_of_matched_indexes.each {|index| hidden_word[index] = generated_word[index]}
      else
        self.wrong_guesses.push(input)
        self.attempts -= 1
      end      
    end
  end

  def save_load(input)
    fname = "save.txt"
    if input == "2"
      File.open(fname, "w"){|file| file.write(to_json)}
    else
      if File.exist?(fname) && !File.empty?(fname)
        loaded_game = JSON.parse(File.read(fname), :symbolize_names => true)
        set_instance_variables(loaded_game)
      end
    end
  end
end

round = Round.new(generated_word: Word.new.word)
round.play