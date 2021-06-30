PLAYER_MARK = "X"
COMPUTER_MARK = "O"
EMPTY_SQUARE = " "
WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]


def display_board(brd,rounds,points_computer,points_player)
	
	puts "Try to beat the Computer!!!"
	puts "---------------------------"
	puts "Round #{rounds}            "
	puts ""
	puts "Player_points | Computer_points "                  
	puts "--------------------------------"
	puts "       #{points_player}      |     #{points_computer}"
	puts "___________________________"
	puts ""
	puts "You're a X. Computer is O."
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

#---------------------------------------------------------------------------

def intialize_board
	
	new_board = {}
	(1..9).each{ |num| new_board[num] = EMPTY_SQUARE } # adds keys from 1 to 9 to new board (hash)
	new_board

end

#----------------------------------------------------------------------------

def set_who_start_first
	
	return_var = nil
	
	puts "who should start first? (p = player or c = computer)"
	
	loop do 
		
		user_input = gets.chomp.downcase
		
		if user_input.split("").first == "p"
			
			return_var = "player"
		
		elsif user_input.split("").first == "c"
			
			return_var = "computer"
		
		else 
			
			puts "no valid input.. please try again"
		
		end
		
		break if return_var
	
	end
	
	return_var

end

#---------------------------------------------------------------

def empty_squares(brd)
	
	empty_squares = []
	
	brd.each{ |k,v| empty_squares << k if v == EMPTY_SQUARE} # ceck which value of the boardkeys is a EMPTY_SQUARE and put the keys in empty_squares (array)
	
	empty_squares

end

#----------------------------------------------------------------

def joinor(arr,symbol = ", ",word = " or ")
	
	arr[0,(arr.length - 1)].join(symbol) + word + arr.pop.to_s # builds a string with possibilities still to be selected

end

#----------------------------------------------------------------

def computer_mark_square!(brd)
	
	square = nil

	# offense first
  WINNING_LINES.each do |line|  
    square = find_at_risk_square(line, brd, COMPUTER_MARK)
    break if square
  end
  
	# defence second
  if !square 
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARK)
      break if square
    end
  end

  
  if !square && brd[5] == EMPTY_SQUARE # pick 5 if its empty (at beginning)
  
		square = 5
	
	elsif !square && brd[5] == PLAYER_MARK && empty_squares(brd).size == 8 # pick 1,3,7 or 9 (at beginning) if 5 is allready taken (important for unbeatable move)
  
		square = [1,3,7,9].sample
	
	elsif !square && brd[5] != EMPTY_SQUARE # try pick 2,4,6 or 8 if its empty and if its not take the first of empty_squares array (important if board is almost full)
		
		arr = [2,4,6,8]
		
		if arr.any?{|k| brd[k] == EMPTY_SQUARE}
		
			loop do
			
				break if brd[square] == EMPTY_SQUARE 
			
				arr = [2,4,6,8]
			
				square = arr.sample 
			
			end
		
		else
		
			square = empty_squares(brd).first
		
		end
	
	end
	
  brd[square] = COMPUTER_MARK # put Computer Mark on the board

end

#---------------------------------------------------------------------


def player_mark_square!(brd)
	
	player_input = 0
	
	loop do 
	
		puts "choose a square #{joinor(empty_squares(brd))}"
		
		player_input = gets.chomp.to_i 
		
		break if brd[player_input] == EMPTY_SQUARE  # chek if player input is valid
		
		puts "no valid input.. please try again"
		
	end
		
	brd[player_input] = PLAYER_MARK # put player mark on board

end

#-----------------------------------------------------------------

def place_piece!(board,current_player)
	
	# check whose turn it is
	if current_player == "player" 
		
		player_mark_square!(board)
	
	elsif current_player == "computer"
		
		computer_mark_square!(board)
	
	end

end

#--------------------------------------------------------------------

def alternate_player(current_player)
	
	# swaps positions of the players
	if current_player == "computer"
		
		return "player"
	
	elsif current_player == "player"
		
		return "computer"
	
	end

end

#-------------------------------------------------------------------

def find_at_risk_square(line, board, marker)
  
	#checks if 2 squares allready marked an included in a Winning line 
	if board.values_at(*line).count(marker) == 2 
    
		board.select{|k,v| line.include?(k) && v == EMPTY_SQUARE}.keys.first
  
	else
    
		nil
  
	end

end

#--------------------------------------------------------------------

def detect_winner(board)

	# check if a player have allready 3 squares in a line
	WINNING_LINES.each do |subarray|
		
		if board[subarray[0]] == PLAYER_MARK && board[subarray[1]] == PLAYER_MARK && board[subarray[2]] == PLAYER_MARK
			
			return "Player"
		
		elsif board[subarray[0]] == COMPUTER_MARK && board[subarray[1]] == COMPUTER_MARK && board[subarray[2]] == COMPUTER_MARK
			
			return "Computer"
		
		end
	
	end
	
	nil

end

#---------------------------------------------------------------------

def some_one_won?(board)
	
	!!detect_winner(board) # turn the return value to a boolean

end

#---------------------------------------------------------------------

def board_full?(board)
	
	empty_squares(board).empty? 

end

#--------------------------------------------------------------------

def replay?
	
	replay = gets.chomp.downcase
	
	if replay == "y"
		
		true
	
	else 
		
		false
	
	end

end

#---------------------------------------------------------------------

def display_who_won_round(board)
	
	if detect_winner(board) == nil
		
		puts "Its a Tie"
	
	else
		
		puts "#{detect_winner(board)} won this round!"
		puts "next round..."
	
	end
	
	sleep(2)

end

#-------------------------------------------------------------------------

def display_congrat_message(points_player,points_computer)
	
	if points_computer < points_player
		
		puts "Player won with #{points_player} points the game!"
		puts "-------------------------------------"
	
	elsif points_computer > points_player
		
		puts "Computer won with #{points_computer} points the game!"
		puts "-------------------------------------"

	else
		
		puts "Its a Tie!"
	
	end

end

#------------------------------------------------------------------------

# main code

loop do #(1)_________main_game_loop_(break if user don't want to replay)____________________________________________________________
	
	rounds = 0						
	points_computer = 0			
	points_player = 0				

	board = intialize_board # build the board

	display_board(board,rounds,points_computer,points_player) 

	beginner = set_who_start_first # ask user who should start first

	puts "You play 5 rounds. The winner is who have the most points!" 
	sleep(2)
	
	
	loop do #(2)_________match_loop_(break when 5 rounds have been played)______________________
		
		board = intialize_board # reset the board after each round
		
		current_player = beginner.dup # reset current_player to the beginnig user selection if user want to replay
		

		loop do #(3)___________round_loop_(break if some one won or board is full)________________
			
			display_board(board,rounds,points_computer,points_player) 
  		
			place_piece!(board, current_player) # depending on who starts, the method calls either "player_mark_square!" "or computer_mark_square!"
  		
			current_player = alternate_player(current_player) # swaps the currentplayer so that the opponent marks the next square
  		
			break if some_one_won?(board) || board_full?(board)  

		end #(/3)_________________________________________________________________________________
		
		
		display_board(board,rounds,points_computer,points_player) 

		display_who_won_round(board) 

		break if rounds == 5
		
		if detect_winner(board) == "Player"	# set points after each match
			
			points_player +=1
		
		elsif detect_winner(board) == "Computer"
			
			points_computer +=1
		
		end

		rounds += 1

	end #(/2)____________________________________________________________________________________

	
	display_board(board,rounds,points_computer,points_player)
	
	display_congrat_message(points_player,points_computer) 
	

	puts "replay? (y/n)" # set the game break conditon to true or false
	replay = replay?

	break if !replay

end #(/1)_____________________________________________________________________________________

puts "Thanks for playing Tic Tac Toe!"
