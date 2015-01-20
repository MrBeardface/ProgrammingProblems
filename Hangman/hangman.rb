require 'yaml'

class Game

  def initialize
    @comp = Computer.new
    @player = Player.new
    @guesses_array = Array.new(@comp.word.nil? ? 10 : @comp.word.length)
    @wrong = Array.new
    @turns = 6
  end

  def play    
    while @turns > 0
      current_guess = @player.guess_letter
      answer = evaluate_guess(current_guess)
      standing = right_wrong_guesses(current_guess)
      if @guesses_array.join("") == @comp.word.join("")
        puts "You won!"
        puts "You guessed #{@comp.word.join("")} correctly!"
        return 
      else
        p @guesses_array
        puts "You have guessed these letters wrongly - #{@wrong}"
        puts "Turns left to complete the word: #{@turns}"
      end
    end
    puts "You lost!"
    puts "The word was #{@comp.word.join("")}"
    return
  end

  def ask_name
    puts "Please enter your first name"
    @first = gets.chomp.downcase
    puts "Please enter your last name"
    @last = gets.chomp.downcase
  end

  def evaluate_guess(current_guess)
    if current_guess == "save"
      save_game
      puts "Your game has been saved #{@first} #{@last}!", "\n"
      elsif @comp.word.each_with_index do |letter, element|
        if @comp.word[element] == current_guess
          @guesses_array[element] = current_guess
        end
      end
    end
  end

  def save_game
    puts "Please enter your first name"
    @first = gets.chomp.downcase
    puts "Please enter your last name"
    @last = gets.chomp.downcase

    Dir.mkdir("saved_games") unless Dir.exists? "saved_games"

    yaml = YAML::dump(self)
    filename = "saved_games/your_saved_game_#{@first}_#{@last}.yaml"
   
    File.open(filename, "w") do |file|
      file.write(yaml)
    end
  end

  def right_wrong_guesses(current_guess)
    if current_guess == "save"
      return
    elsif !@comp.word.include?(current_guess)
      @wrong << current_guess
      @turns -= 1
    end
  end
end

class Computer
  attr_reader :word

  def initialize
    @word = word_choices
  end

  def word_choices
    words = File.open("5desk.txt").read
    new_words = words.split(" ")  
    listed_words = new_words.map do |word|
      if word.length > 4 && word.length < 13
        word
      end
    end
    listed_words = listed_words.compact!
    random_words = listed_words.shuffle
    random_words.pop.downcase.split("")
  end
end

class Player

  attr_accessor :first, :last

  def guess_letter
    puts "Please guess a letter between a-z"
    puts "Or you can choose to save your game and return later by typing in save"
    guess = gets.chomp.downcase 
  end
end


  def load_game
    puts "please enter your first name"
    @first = gets.chomp.downcase
    puts "please enter your last name"
    @last = gets.chomp.downcase

    content = File.open("saved_games/your_saved_game_#{@first}_#{@last}.yaml", 'r') { |file| file.read }
    YAML.load(content)
  end

  def valid_input(q)
  input = ''
    until input == 'y' || input == 'n'
      print q
      input = gets.chomp
    end
    input
  end

  puts "\nWELCOME TO HANGMAN\n"
  loop do 
    input = valid_input('Do you want to load previously saved game (y/n)? ')
    puts "Thank you.  You can save game at any moment by typing 'save'."
    game = input == 'y' ? load_game : Game.new
    game.play
    input2 = valid_input('Play another game (y/n)? ')
    break if input2 == 'n'
  end