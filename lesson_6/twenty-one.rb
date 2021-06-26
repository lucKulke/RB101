CARDS = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
VALUES = {2=> 2, 3=> 3, 4=> 4, 5=> 5, 6=> 6, 7=> 7, 8=> 8, 9=> 9, 10=> 10, "J"=> 10, "Q"=> 10, "K"=> 10, "A"=> 11}


def display_card_board(dealer_cards,player_cards,dealer_total_points,player_total_points)
	system "clear"
	puts "      Twenty-One       "
				

	puts "  PlayerP. |  DealerP. "
	puts "-----------------------"
	puts "     #{player_total_points}   |   #{dealer_total_points}"
	puts "_______________________"
	puts ""
	puts "Dealer: (points = #{point_controller(dealer_cards)})" 
	puts "cards => #{dealer_cards}"
	puts ""
	puts "Player: (points = #{point_controller(player_cards)})"
	puts "cards => #{player_cards}"
	puts "_______________________"

end

def game_points(player_total_points,dealer_total_points,player_cards,dealer_cards)
	winner = who_won?(player_cards,dealer_cards)
	

	if winner == "player won"
		player_total_points = player_total_points + 1
	elsif winner == "dealer won"
		dealer_total_points = dealer_total_points + 1
	end

end

def some_one_won?(player_cards,dealer_cards)
	!!who_won?(player_cards,dealer_cards)
end

def who_won?(player_cards,dealer_cards)
	return_var = nil
	player = point_controller(player_cards)
	dealer = point_controller(dealer_cards)
	if (player > dealer && !over_21?(player_cards)) || over_21?(dealer_cards) 
		return_var = "player won"
	elsif (player < dealer && !over_21?(dealer_cards)) || over_21?(player_cards)
		return_var = "dealer won"
	elsif player == dealer && dealer > 17
		return_var = "tie"
	else 
		nil
	end
	return_var
end




def point_controller(cards)
	points = 0

	cards.each{ |card| points += VALUES[card]}

	cards.each do |card|
		if card == VALUES["A"] && points > 21
			points -= 10
		end

	end
	


	points
end


def over_21?(cards)
	points = 0
	bust = false
	if point_controller(cards) > 21
		bust = true
	end
	bust
end

def intialize_deck
	deck = []
	4.times{deck << CARDS}
	deck.flatten
end

def player_turn!(deck,player_cards,dealer_cards,dealer_total_points,player_total_points)
	stay = false
	loop do 
	puts "hit or stay?"
		
		loop do # loop check if input valid and give player new card if he enter "hit"
			user_input = gets.chomp
			if user_input == "hit"
				player_cards << deck.shift
			elsif user_input == "stay"
				stay = true
			else
				puts "not valid input"
			end
			break if user_input == "hit" || user_input == "stay"
		end 
		
		display_card_board(dealer_cards,player_cards,dealer_total_points,player_total_points)
		
		who_won?(player_cards,dealer_cards)
		
		break if over_21?(player_cards) || stay == true
	
	end

end

def dealer_turn!(deck,player_cards,dealer_cards,dealer_total_points,player_total_points)
	stay = false
	loop do 
		if point_controller(dealer_cards) < 17
			dealer_cards << deck.shift
		else
			stay = true
		end
		sleep(2)
		display_card_board(dealer_cards,player_cards,dealer_total_points,player_total_points)
		break if over_21?(dealer_cards) || stay == true
	end

end

# main

loop do
	
	deck = intialize_deck.shuffle
	player_total_points = 0
	dealer_total_points = 0


	loop do 
		new_round = ""
		player_cards = deck.shift(2)
		dealer_cards = deck.shift(2)

		loop do 


			display_card_board(dealer_cards,player_cards,dealer_total_points,player_total_points)

			player_turn!(deck,player_cards,dealer_cards,dealer_total_points,player_total_points)
			
			break if some_one_won?(player_cards,dealer_cards)			
			
			dealer_turn!(deck,player_cards,dealer_cards,dealer_total_points,player_total_points)
			
			display_card_board(dealer_cards,player_cards,dealer_total_points,player_total_points)

			break if some_one_won?(player_cards,dealer_cards)
			
			
		end	

		game_points(player_total_points,dealer_total_points,player_cards,dealer_cards)
		
		display_card_board(dealer_cards,player_cards,dealer_total_points,player_total_points)

		p who_won?(player_cards,dealer_cards)

		loop do 
			puts "new round?"
			new_round = gets.chomp.downcase
			break if new_round == "y" || "n"
			puts "no valid input"
		end

		break if new_round == "n"
	end

end