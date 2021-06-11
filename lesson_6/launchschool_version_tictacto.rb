PLAYER_MARK = "X"
COMPUTER_MARK = "O"
EMPTY_SQUARE = " "

def display_board(brd)
	system "clear"
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

def joinor(arr,symbol = ",",word = "or")
	arr[0,(arr.length - 1)].join(symbol) + word + arr.pop.to_s
end

def player_mark_square!(brd)
	player_input = 0
	loop do 
	
	puts "choose a square #{joinor(empty_squares(brd) ," and ")}"
	player_input = gets.chomp.to_i
	break if brd[player_input] == EMPTY_SQUARE
	puts "no valid input.. please try again"
	end
	brd[player_input] = PLAYER_MARK
end


def computer_mark_square!(brd)
	computer_input = empty_squares(brd).sample
	brd[computer_input] = COMPUTER_MARK
end


def some_one_won?(board)
	!!detect_winner(board)
end

def detect_winner(board)
	profit_opportunities = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

	profit_opportunities.each do |subarray|
		if board[subarray[0]] == PLAYER_MARK && board[subarray[1]] == PLAYER_MARK && board[subarray[2]] == PLAYER_MARK
			return "Player"
		elsif board[subarray[0]] == COMPUTER_MARK && board[subarray[1]] == COMPUTER_MARK && board[subarray[2]] == COMPUTER_MARK
			return "Computer"
		end
	end
	nil
end



def board_full?(board)
	empty_squares(board).empty?
end



def empty_squares(brd)
	empty_squares = []
	brd.each{ |k,v| empty_squares << k if v == EMPTY_SQUARE}
	empty_squares
end


def replay?
	puts "replay?"
	replay = gets.chomp.downcase
	if replay == "y"
		true
	elsif 
		false
	end
end


# main code

loop do

	board = intialize_board

	display_board(board)

	loop do 
		player_mark_square!(board)
		display_board(board)
		break if some_one_won?(board) || board_full?(board)
		computer_mark_square!(board)
		display_board(board)
		break if some_one_won?(board) || board_full?(board)

	end

	if some_one_won?(board)
		puts "#{detect_winner(board)} won the game!"
		puts "-------------------------------------"
	else
		puts "its a Tie"
	end

	puts "Play again? (y or n)"
	answere = gets.chomp.downcase

	break if answere.start_with?("n")
end

puts "Thanks for playing Tic Tac Toe!"
