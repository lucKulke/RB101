require "pry"
PLAYER_MARK = "X"
COMPUTER_MARK = "O"
EMPTY_SQUARE = " "
WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]


def display_board(brd,rounds,points_computer,points_player)
	system "clear"
	
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

def intialize_board
	new_board = {}
	(1..9).each{ |num| new_board[num] = EMPTY_SQUARE }
	new_board
end

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

def empty_squares(brd)
	empty_squares = []
	brd.each{ |k,v| empty_squares << k if v == EMPTY_SQUARE}
	empty_squares
end

def joinor(arr,symbol = ", ",word = " or ")
	
	arr[0,(arr.length - 1)].join(symbol) + word + arr.pop.to_s
end

def computer_mark_square!(brd)
	square = nil

	# offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARK)
    break if square
  end

  
  # defence first
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARK)
      break if square
    end
  end

  if brd[5] == PLAYER_MARK && empty_squares(brd).size == 8
  	square = [1,3,7,9].sample
  end
  # pick 5 if its empty
  if !square && brd[5] == EMPTY_SQUARE
  	brd[5] = COMPUTER_MARK
  elsif !square && brd[5] != EMPTY_SQUARE# else pick a random square
    square = [2,4,6,8].sample
  elsif !square
  	square = empty_squares(brd).sample
  end
  

  brd[square] = COMPUTER_MARK
end

def player_mark_square!(brd)
	player_input = 0
	loop do 
	
	puts "choose a square #{joinor(empty_squares(brd))}"
	player_input = gets.chomp.to_i
	break if brd[player_input] == EMPTY_SQUARE
	puts "no valid input.. please try again"
	end
	brd[player_input] = PLAYER_MARK
end

def place_piece!(board,current_player)
	if current_player == "player"
		player_mark_square!(board)
	elsif current_player == "computer"
		computer_mark_square!(board)
	end
end

def alternate_player(current_player)
	if current_player == "computer"
		return "player"
	elsif current_player == "player"
		return "computer"
	end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == EMPTY_SQUARE}.keys.first
  else
    nil
  end
end

def detect_winner(board)

	WINNING_LINES.each do |subarray|
		if board[subarray[0]] == PLAYER_MARK && board[subarray[1]] == PLAYER_MARK && board[subarray[2]] == PLAYER_MARK
			return "Player"
		elsif board[subarray[0]] == COMPUTER_MARK && board[subarray[1]] == COMPUTER_MARK && board[subarray[2]] == COMPUTER_MARK
			return "Computer"
		end
	end
	nil
end

def some_one_won?(board)
	
	!!detect_winner(board)
end

def board_full?(board)
	
	empty_squares(board).empty?
end

def replay?
	replay = gets.chomp.downcase
	if replay == "y"
		true
	else 
		false
	end
end

def display_who_won_round(board)
	if detect_winner(board) == nil
		puts "Its a Tie"
	else
		puts "#{detect_winner(board)} won this round!"
		puts "next round..."
	end
	sleep(2)
end

def display_congrat_message(points_player,points_computer)
	if points_computer < points_player
		puts "Player won with #{points_player} points the game!"
		puts "-------------------------------------"
	elsif points_computer > points_player
		puts "Computer won with #{points_computer} points the game!"
		puts "-------------------------------------"
	else
		puts "its a Tie"
	end
end






# main code

loop do # game loop
	
	rounds = 0
	points_computer = 0
	points_player = 0

	board = intialize_board # build the board

	display_board(board,rounds,points_computer,points_player) # display the board

	beginner = set_who_start_first # ask user who should start


	puts "you play 5 rounds, the winner is who have the most points" 
	
	loop do #game loop (5 rounds to win)
		
		
		board = intialize_board #reset the board after each round
		
		display_board(board,rounds,points_computer,points_player) 
		
		current_player = beginner.dup # reset current_player to the beginnig user selection
		
		loop do # round loop break if some one won or board is full

			display_board(board,rounds,points_computer,points_player) 
  		place_piece!(board, current_player) # depending on who starts the method calls either player_mark_square or computer_mark_square!
  		current_player = alternate_player(current_player) # swaps the currentplayer so that the opponent marks the next square
  		break if some_one_won?(board) || board_full?(board)  

		end
		
		display_board(board,rounds,points_computer,points_player) 

		display_who_won_round(board)

		break if rounds == 5
		
		if detect_winner(board) == "Player"	# set points after each round
			points_player +=1
		elsif detect_winner(board) == "Computer"
			points_computer +=1
		end

		rounds += 1

	end

	display_board(board,rounds,points_computer,points_player)
	
	display_congrat_message(points_player,points_computer) # display congrat massage addressed to player or computer
	

	puts "replay? (y/n)" # set the game break conditon to true or false
	replay = replay?

	break if !replay
end

puts "Thanks for playing Tic Tac Toe!"
