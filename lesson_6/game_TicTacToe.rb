PLAYER_1_MARKER = "X"
PLAYER_2_MARKER, COMPUTER_MARKER = "O","O"
EMPTY_SQUARE = " "



# METHODS


def display_board(brd)
	puts "************************"
	puts "*        BOARD         *"
	puts "*        -----         *"
	puts "*                      *"
	puts "*       |     |        *"
	puts "*    #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}     *"	    
	puts "*       |     |        *"
	puts "*  -----------------   *"
	puts "*       |     |        *"
	puts "*    #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}     *"
	puts "*       |     |        *"
	puts "*  -----------------   *"
	puts "*       |     |        *"
	puts "*    #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}     *"
	puts "*       |     |        *"
	puts "*                      *"
	puts "************************"
end

def initilize_board
	new_board = {}
	(1..9).each {|num| new_board[num]= " "}
	new_board
end


def computer_ki(board)
	valid_input = false
	loop do 	
		computer_input = rand(1..9)
		if board[computer_input] == " "
			board[computer_input] = COMPUTER_MARKER
			valid_input = true
		end
		break if valid_input == true
	end
end

def player_marks_squer(board, player)
	
	valid_player_input = false
		
	if player == "1"
		puts " "
		puts ">> player 1 please mark a square"
		puts " "
	elsif player == "2"
		puts " "
		puts ">> player 2 please mark a square"
		puts " "
	end
		loop do 
			break if valid_player_input == true	

			user_input = gets.chomp.to_i
			
			if board[user_input] == " "
				if player == "1"
					board[user_input] = PLAYER_1_MARKER
				elsif player == "2"
					board[user_input] = PLAYER_2_MARKER
				end	
				valid_player_input = true
			else   
				puts "square already marked.. please mark a empty square"
			end
		end
end


def game_controler_winner(board)
	return_var = ""
	for idx in (0..2)
		if (board[idx*3+1] == board[idx*3+2]) && (board[idx*3+2] == board[idx*3+3]) && (board[idx*3+1] == "X") ||# horizontal
			 (board[idx*3+1] == board[(idx + 1)*3+2]) && (board[(idx + 1)*3+2] == board[(idx + 2)*3+3]) && board[idx*3+1] =="X" || # diagonal top left to bottem right
			 (board[idx*3+3] == board[(idx + 1)*3+2]) && (board[(idx + 1)*3+2] == board[(idx + 2)*3+1]) && board[idx*3+3] =="X" || # diagonal top right to bottem left
			 (board[(idx +1)+((idx+0)*3)] == board[(idx +1)+((idx+1)*3)]) && (board[(idx +1)+((idx+1)*3)] == board[(idx +1)+((idx+2)*3)]) && (board[(idx +1)+((idx+0)*3)] == "X")  #vertikal
			return_var = "player"


		elsif(board[idx*3+3] == board[(idx + 1)*3+2]) && (board[(idx + 1)*3+2] == board[(idx + 2)*3+1]) && board[idx*3+3] =="O" ||
				 (board[idx*3+1] == board[(idx + 1)*3+2]) && (board[(idx + 1)*3+2] == board[(idx + 2)*3+3]) && board[idx*3+1] =="O" ||
				 (board[idx*3+1] == board[idx*3+2]) && (board[idx*3+2] == board[idx*3+3]) && (board[idx*3+1] == "O") ||
				 (board[(idx +1)+((idx+0)*3)] == board[(idx +1)+((idx+1)*3)]) && (board[(idx +1)+((idx+1)*3)] == board[(idx +1)+((idx+2)*3)]) && (board[(idx +1)+((idx+0)*3)] == "O") 
			return_var = "computer"
		end

	end
	return return_var
end


def game_controler_boardfull(board)
	if board.values.all? { |e| e != " " }
		return true
	else
		return false
	end
end


def display_winner_congrat(winner)
	if winner == "computer"
		puts " ----------------------"
		puts "Computer won the game.."
		puts "-----------------------"
		puts " "

	elsif winner == "player"
		puts "---------------------"
		puts "Player 1 is the winner!!!"
		puts "---------------------"
		puts " "
	elsif winner == "player_2"
		puts "---------------------"
		puts "Player 2 is the winner!!!"
		puts "---------------------"
		puts " "
	end
end


def display_tie_boardfull
	puts "----------"
	puts "Its a Tie!"
	puts "----------"
	puts " "
end

def display_computer_mark
	puts " "
	puts "computer marks a square.."
	puts " "
end

def display_round_cut
	puts "__________________________________________________"
	puts "__________________________________________________"
end

def choose_gamemodi
	puts " "
	puts "%%%%%%%%%%%%%%%%%%%%%% "
	puts "GAMEMODI"
	puts "----------------------"
	puts "1. Player vs Player"
	puts " "
	puts "2. Player vs Computer"
	puts "----------------------"
	puts "%%%%%%%%%%%%%%%%%%%%%%"
	puts " "
	valid_input = false
	loop do 
		user_input = gets.chomp
		if user_input == "1"
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			puts "# You choose Gamemodi: Player vs Player #"
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			valid_input == true
			return "1"
		elsif user_input == "2"
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			puts "# You choose Gamemodi: Player vs Computer #"
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			valid_input == true
			return "2"
		end
	end	
end

def display_msg
	puts promt = <<-MSG

					(1)|(2)|(3)
					-----------
					(4)|(5)|(6)
					-----------
					(7)|(8)|(9)

  MSG
end
# MAIN


replay = true

# game loop
loop do 
	break if replay == false

	board = initilize_board # creats a empty board
	

	winner_player_1 = false
	winner_opponent = false
	board_full = false

	agianst_player = false
	agianst_computer = false
	
	computer_input = 0

	
	gamemodi = choose_gamemodi
	if gamemodi == "1"
		agianst_player = true
	else
		agianst_computer = true
	end

	# Round loop
	loop do 
		
		break if winner_player_1 == true || winner_opponent == true || board_full == true 
		display_msg
		display_board(board)
		
		

		
		# player one marks square
		#-----------------------------------------------------------------------
		
		player_marks_squer(board,"1")
		
		#------------------------------------------------------------------------

		#check if player already won the game because player 1 is always the beginner. if thats the case opponents turn will skiped.
		#------------------------------------------------------------------------
		
		if game_controler_winner(board) == "player" 
			winner_player_1 = true
		end
		
		#-------------------------------------------------------------------------


		# check if board already full. if thats the case the opponents turn will be skiped
		#-------------------------------------------------------------------------
		
		board_full = game_controler_boardfull(board) # chek if board allready full
		
		#-------------------------------------------------------------------------

		display_board(board)

		
		# opponent marks a square (computer or player 2 depends on what gamemode is selected)
		#------------------------------------------------------------------------
		
		if winner_player_1 == false
			if agianst_player == false
				display_computer_mark
				computer_ki(board)
			elsif agianst_player == true
				player_marks_squer(board,"2")
			end
		end

		#-------------------------------------------------------------------------


		display_round_cut

		
		# check who won the game and print congrat message + set the breakcondition to true
		#--------------------------------------------------------------------------

		if game_controler_winner(board) == "computer" && agianst_player == false
			display_winner_congrat("computer")
			winner_opponent = true
		elsif game_controler_winner(board) == "computer" && agianst_player == true
			display_winner_congrat("player_2")
			winner_opponent = true
		elsif game_controler_winner(board) == "player"
			display_winner_congrat("player")
			winner_player_1 = true
		end
		
		#---------------------------------------------------------------------------

		# check if the board is full and if thats the case print tie message and set the round break condition to true
		#---------------------------------------------------------------------------
		
		board_full = game_controler_boardfull(board)
		if board_full == true
			tie_boardfull
		end
		
		#---------------------------------------------------------------------------

	end

	# gameloop replay question
	puts "replay? (y/n)"
	user_input_replay = gets.chomp.downcase
	replay = false if user_input_replay == "n"
		

end


