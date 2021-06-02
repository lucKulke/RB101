
# METHODS

def display_board(brd)
	
	puts "      BOARD"
	puts "      -----"
	puts " "

	puts "     |     |     "
	puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}    "	    
	puts "     |     |     "
	puts "-----------------"
	puts "     |     |     "
	puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}    "
	puts "     |     |     "
	puts "-----------------"
	puts "     |     |     "
	puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}    "
	puts "     |     |     "
end

def initilize_board
	new_board = {}
	(1..9).each {|num| new_board[num]= " "}
	new_board
end


def computer_ki(board)
	marked_spuare = 0
	
	board[]	

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


def winner_congrat(winner)
	if winner == "computer"
		puts " ----------------------"
		puts "Computer won the game.."
		puts "-----------------------"
		puts " "

	elsif winner == "player"
		puts "---------------------"
		puts "You are the winner!!!"
		puts "---------------------"
		puts " "
	end
end


def tie_boardfull
	puts "----------"
	puts "Its a Tie!"
	puts "----------"
	puts " "
end

def computer_mark
	puts " "
	puts "computer marks a square.."
	puts " "
	puts "___________________________________________"
	puts "___________________________________________"
	puts " "
end

# MAIN


replay = true

# game loop
loop do 

	break if replay == false

	board = initilize_board # creats a empty board
	
	winner_player = false
	
	winner_computer = false
	
	board_full = false
	
	computer_input = 0

	startpoint = false

	# Round loop
	loop do 
		

		display_board(board)
		
		break if winner_player == true || winner_computer == true || board_full == true

		
		# player marks square
		#------------------------------------------------------------------------
		puts "please mark square.."
		
		# valid_player_input loop 
		valid_player_input = false
		loop do 

			user_input = gets.chomp.to_i
			if board.key?(user_input) && board[user_input] == " "
				board.each do|k,v| 
					board[user_input] = "X"
				end	
				valid_player_input = true
			else   
				valid_player_input = false
				puts "square already marked.. please mark a empty square"
			end


			break if valid_player_input == true	
		end
		
		#------------------------------------------------------------------------

		
		if game_controler_winner(board) == "player" # chek if player won the game and if thats the case round break condition set to true
			winner_player = true
		end
		

		board_full = game_controler_boardfull(board) # chek if board allready full

		
		# computer marks square
		#------------------------------------------------------------------------
		computer_mark
		
		# computer ki starts after startpoint is set
		if startpoint == true
		  computer_input = computer_ki(board)
		end

		#set start point
		loop do 
			break if startpoint == true
			loop do 
				break if board[computer_input] == " "
			  computer_input = rand(1..9)
			  startpoint = true
			end
		end

		board.each{|k,v| board[k] = "O" if (computer_input == k && v == " ")}


		
		if board_full == false # when board already full computer dont try to mark
			loop do 
				computer_input = rand(1..9) 
				break if board[computer_input] == " " 
			end
		end
		 
		#-------------------------------------------------------------------------

		
		# check if computer won the game and if thats the case round break conditon is set to true and winner congrats is displayed
		if game_controler_winner(board) == "computer"
			winner_congrat("computer")
			winner_computer = true
		elsif winner_player == true
			winner_congrat("player")
		end
		
		# Board check if it is full(Tie)
		board_full = game_controler_boardfull(board)
		if board_full == true
			tie_boardfull
		end

	end

	# gameloop replay question
	puts "replay? (y/n)"
	user_input_replay = gets.chomp.downcase
	replay = false if user_input_replay == "n"
		

end


