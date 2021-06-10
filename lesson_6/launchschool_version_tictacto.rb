PLAYER_MARK = "X"
COMPUTER_MARK = "O"
EMPTY_SQUARE = " "

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


def intialize_board
	new_board = {}
	(1..9).each{ |num| new_board[num] = EMPTY_SQUARE }
	new_board
end


def player_mark_square!(brd)
	player_input = 0
	loop do 
	puts "choose a square (#{empty_squares})"
	player_input = gets.chomp.to_i
	break if brd[player_input] == EMPTY_SQUARE
	puts "no valid input.. please try again"
	end
	brd[player_input] = PLAYER_MARK
end


def empty_squares(brd)
	empty_squares = []
	brd.each{ |k,v| empty_squares << k if v == EMPTY_SQUARE}
	empty_squares
end

board = intialize_board
display_board(board)
player_mark_square(board)