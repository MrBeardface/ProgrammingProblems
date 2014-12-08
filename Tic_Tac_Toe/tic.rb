class Player
	attr_accessor :name
	
	def initialize(name)
		@name = name
		
	end
end

class Game
	attr_accessor :ended, :show_board, :move

	def initialize
		@board = [["A", "B", "C"], 
						 ["D", "E", "F"], 
						 ["G", "H", "I"]]
		@count = 1
		@ended = false
	end

	def start_game
		puts "Lets play tic-tac-toe!"

		game_players
	end

	def game_players
		players = []
		puts "Player 1, please choose your name: "
		player1 = gets.chomp
		px = Player.new(player1)
		players.push(px)
		puts "#{px.name} you're X"

		puts "Player 2, please choose your name: "
		player2 = gets.chomp
		po = Player.new(player2)
		players.push(po)
		puts "#{po.name} you're O"
		puts "Game Started!"
		directions
		while(!ended)
	 		players.each do |player|
	 			show_board
	 			puts "#{player.name} please pick a position."
	 				position = gets.chomp
	 			puts "#{player.name} please pick choose type"
	 				type = gets.chomp
	 			move(position, type)
	 			break if ended	
	 		end
	 	end
	end
  
  def show_board
    p @board
  end

	def move(position, type)
		position = position.upcase
		type = type.upcase
			if position == "X" || position == "O"
				puts "that space is already taken"
			elsif type != "X" && type != "O"
				puts "Please put an X or O"
			else
	  		@board.collect! { |i| i.include?(position) ? (i[i.index(position)] = type; i) : i }
	  		@count += 1
	  	end
  	if win?
  		play_again?
  	elsif @count == 10
  		puts "TIE!"
  		play_again?
  	else
  		@ended = false
	  end
	end

  def directions
  	puts "To play: "
	end

	
	protected
  def over?
  	@ended = true
  	puts "Hope you had fun playing, come back soon!"
  	
  end

	def win?	
  	board_at = @board.flatten
  	@ended = false
  		if board_at[0] == board_at[3] && board_at[0] == board_at[6]
  			return true
  		elsif board_at[1] == board_at[4] && board_at[1] == board_at[7]
  			return true
  		elsif board_at[2] == board_at[5] && board_at[2] == board_at[8]
  			return true
  		elsif board_at[0] == board_at[1] && board_at[0] == board_at[2]
  			return true
  		elsif board_at[3] == board_at[4] && board_at[3] == board_at[5]
  			return true
  		elsif board_at[6] == board_at[7] && board_at[6] == board_at[8]
  			return true
  		elsif board_at[0] == board_at[4] && board_at[0] == board_at[8]
  			return true
  		elsif board_at[2] == board_at[4] && board_at[2] == board_at[6]
  			return true
  		else
  			@ended = false
  		end
  	end

  	private
  	def weird_answer
  		puts "Yea, I only work for people who listen to me."
  		@ended = true
  	end

  	def reset_board
  		@board = [["A", "B", "C"], 
  						 ["D", "E", "F"], 
  						 ["G", "H", "I"]]
  	end

  	def play_again?
  		puts "Do you want to play again? y or n"
  		answer = gets.chomp.downcase
  		if answer == "y"
  			reset_board
			elsif answer == "n"
				over?
			elsif answer != "n" && answer != "y"
				weird_answer
			end
		end
  end

game = Game.new
game.start_game