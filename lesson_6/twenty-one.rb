CARDS = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
VALUES = {2=> 2, 3=> 3, 4=> 4, 5=> 5, 6=> 6, 7=> 7, 8=> 8, 9=> 9, 10=> 10, "J"=> 10, "Q"=> 10, "K"=> 10, "A"=> 11}


def display_card_board(player_cards,dealer_cards,points,whose_turn_is,hidden_card)
	system "clear"

	puts "______Twenty-One_______"
	puts ""
	puts "  PlayerP. |  DealerP. "
	puts "-----------------------"
	puts "     #{points["player"]}    |    #{points["dealer"]}"
	puts "_______________________"
	puts ""
	puts "Dealer: " 
	puts "cards => #{at_beginning(dealer_cards,hidden_card)}"
	puts ""
	puts "Player: "
	puts "cards => #{player_cards}"
	puts "_______________________"
	puts ""
	puts "------>>#{whose_turn_is}<<-------"
	puts "_ _ _ _ _ _ _ _ _ _ _ _"
	puts ""

end

#-----------------------------------------------

def at_beginning(dealer_cards,hidden_card)
	if hidden_card == true
		return dealer_cards[0]
	else
		return dealer_cards
	end
end

#-----------------------------------------------

def intialize_deck
	
	deck = []
	4.times{deck << CARDS}
	deck.flatten.shuffle

end

#-----------------------------------------------

def give_cards(player_cards, dealer_cards, deck)
	
	2.times{player_cards << deck.pop}
	2.times{dealer_cards << deck.pop}

end

#-----------------------------------------------

def determine_points_player(points,player_cards)

	points["player"] = 0
	
	player_cards.each do |card|
		points["player"] +=	VALUES[card]
	end
	
	player_cards.each do |card|
		
		if card == "A" && points["player"] > 21
			points["player"] -= 10
		end
	
	end

end

#-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 

def determine_points_dealer(points,dealer_cards,hidden_card)

	points["dealer"] = 0

	if hidden_card == true
		
		points["dealer"] += VALUES[dealer_cards[0]]
		
	else
		
		dealer_cards.each do |card|
			points["dealer"] +=	VALUES[card]
		end
		
		dealer_cards.each do |card|
			
			if card == "A" && points["dealer"] > 21
				points["dealer"] -= 10
			end
		
		end
	
	end

end

#-----------------------------------------------

def player_turn(player_cards,deck)

	player_choice = ""

	loop do
		
		puts "hit or stay?"
		user_input = gets.chomp.downcase
		
		player_choice = user_input.split("").first
		
		break if player_choice == "h" || player_choice == "s"
		
		puts "not valid input.."
	
	end

	if player_choice == "h"

		player_cards << deck.pop
		return false
	
	else

		return true

	end

end

#---------------------------------------------

def dealer_turn(dealer_cards,deck,points)

	if points["dealer"] > 21
	
		return true
	
	elsif 
	
		if points["dealer"] < 17
	
			dealer_cards << deck.pop
	
		else
	
			return true
	
		end

	end
	
	nil

end

#--------------------------------------------

def some_one_won?(points,round_end)

	!!who_won?(points,round_end)

end

#-  -  -  -  -  -  -  -  -  -  -  -  -  -  -	

def who_won?(points,round_end)

	if points["player"] > 21
		
		return "Dealer"
	
	elsif points["dealer"] > 21

		return "Player"
	
	end


	if round_end == true

		if points["dealer"] < points["player"]

			return "Player"
		
		elsif points["dealer"] > points["player"]
			
			return "Dealer"

		elsif points["dealer"] == points["player"]

			return "No one"
		
		end

	end

	nil

end

#--------------------------------------------

def new_round?
	
	new_round = ""
	
	loop do 
		
		puts "New round? (y/n)"
		
		user_input = gets.chomp.downcase
		new_round = user_input.split("").first
		
		break if new_round == "y" || new_round == "n"
		
		puts "not valid input"
	
	end

	if new_round == "n"
		
		return true
	
	else
		
		nil
	
	end

end

#--------------------------------------------

def mix_deck?(deck)

	new_round = ""

	puts "The deck is out of cards" if deck_empty?(deck)
		
	loop do 
		
		puts "Mix the deck or quit the game? (m/q)"
		
		user_input = gets.chomp.downcase
		new_round = user_input.split("").first
		
		break if new_round == "m" || new_round == "q"
		
		puts "not valid input"
	
	end

	if new_round == "q"
	
		return true
	
	else
	
		nil
	
	end

end

#-------------------------------------------

def deck_empty?(deck)
	
	if deck.size < 4
		true
	else
		nil
	end

end

#--------------------------------------------

# main code

system "clear"
puts "Welcome to twenty-one !"
sleep(2)

loop do 

	deck = intialize_deck
	
	loop do
		player_cards = []
		dealer_cards = []
		points = {"player" => 0, "dealer" => 0}	

		hidden_card = true
		round_end = false

		give_cards(player_cards,dealer_cards,deck)
		
		determine_points_player(points,player_cards)
		determine_points_dealer(points,dealer_cards,hidden_card)


		loop do 
			
			display_card_board(player_cards,dealer_cards,points,"Player",hidden_card)
			
			stay = player_turn(player_cards,deck)
			
			determine_points_player(points,player_cards)
			
			break if stay || some_one_won?(points,round_end)
		
		end

		hidden_card = false

		loop do 
			
			determine_points_dealer(points,dealer_cards,hidden_card)
			
			display_card_board(player_cards,dealer_cards,points,"Dealer",hidden_card)
			
			break if some_one_won?(points,round_end)
			
			sleep(2)
		
			stay = dealer_turn(dealer_cards,deck,points)
			
			determine_points_dealer(points,dealer_cards,hidden_card)
			
			display_card_board(player_cards,dealer_cards,points,"Dealer",hidden_card)

			break if stay || some_one_won?(points,round_end)
		
		end
		
		round_end = true

		puts "#{who_won?(points,round_end)} won this round!!!"

		new_round = new_round?

		break if new_round || deck_empty?(deck)
		
	end

	mix_deck = mix_deck?(deck)

break if mix_deck 

end

system "clear"
puts "Thanks for playing twenty-one!"
sleep(2)