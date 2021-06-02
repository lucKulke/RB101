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

def initilize_board()
	new_board = {}
	(1..9).each {|num| new_board[num]= " "}
	new_board
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
	puts "boad full"
	board.keys.all? { |e| e != " " }
end

#main

# game loop
board = initilize_board

loop do 
	replay = true
	break if replay == false
	winner_player = false
	winner_computer = false
	board_full = false

	
	loop do 
		display_board(board)

		# player marks square
		puts "please mark square"
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



		
		# computer marks square
		puts "computer marks square"
		computer_input = 3
		board.each{|k,v| board[k] = "O" if (computer_input == k && v == " ")}


		# winner_player = true if 
		if game_controler_winner(board) == "player"
			winner_player = true
		elsif game_controler_winner(board) == "computer"
			winner_computer = true
		end


		board_full = game_controler_boardfull(board)

		p board

		break if winner_player == true 
	end

	

end


