class Game
  COLORS = ["R", "G", "B", "Y", "O", "P"]
 
  def initialize
    @comp = Computer.new
    @player = Player.new
  end
 
  def play
    10.times do |i|
      puts "This is chance #{i+1} of 10"
      current_guess = @player.guess_code
      standing = evaluate_guess(current_guess)
 
      if standing[:exact].length == 4
        puts "You won!"
        return
      else
        puts "#{standing[:exact].length} Exact Matches"
        puts "#{standing[:near].length} Near Matches"
      end
    end
    puts "You lost!"
    return
  end
 
  def evaluate_guess(current_guess)
    results = { :exact => [], :near => [] }
    current_guess.each_with_index do |choice, position|
      if exact_match?(choice, position)
        results[:exact] << true
      elsif near_match?(choice)
        results[:near] << true
      end
    end
    results
  end
 
  def near_match?(choice)
    @comp.code_combination.include?(choice)
  end
 
  def exact_match?(choice, position)
    choice == @comp.code_combination[position]
  end
end
 
class Computer
  attr_reader :code_combination
 
  def initialize
    @code_combination = code
  end
 
  def code
    colors = Game::COLORS.shuffle
    generated_code = []
    4.times{ generated_code << colors.pop }
    generated_code
  end
end
 
class Player
  def guess_code
    puts 'What is your guess? Choose one of the following: "R", "G", "B", "Y", "O", "P"'
    converted_guess(gets.chomp)
  end
 
  def converted_guess(guess)
    guess.split('')
  end
end

new_game = Game.new
new_game.play