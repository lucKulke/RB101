SUIT = ["\u2663", "\u2666", "\u2665", "\u2660"]
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11 }
SPECIAL_CARD = "A"
MAX_VALUE = 21
MIN_VALUE = 17

def display_card_board(player_cards, dealer_cards, points, whose_turn_is, hidden_card, deck)
  system "clear"
  puts "______Twenty-One_______"
  puts ""
  puts "Deck size = #{deck.size}"
  puts ""
  puts "  PlayerP. |  DealerP. "
  puts "-----------------------"
  puts "     #{points['player']}    |    #{points['dealer']}"
  puts "_______________________"
  puts ""
  puts "Dealer:"
  puts "cards => #{at_beginning(dealer_cards, hidden_card)}"
  puts ""
  puts "Player: "
  puts "cards => #{player_cards}"
  puts "_______________________"
  puts ""
  puts "------>>#{whose_turn_is}<<-------"
  puts "_ _ _ _ _ _ _ _ _ _ _ _"
  puts ""
end

def at_beginning(dealer_cards, hidden_card)
  if hidden_card == true
    dealer_cards[0]
  else
    dealer_cards
  end
end

def initialize_deck
  SUIT.product(CARDS).shuffle
end

def give_cards(player_cards, dealer_cards, deck)
  2.times { player_cards << deck.pop }
  2.times { dealer_cards << deck.pop }
end

def determine_points_player(points, player_cards)
  points["player"] = 0
  player_cards.each do |card|
    points["player"] +=	VALUES[card.last]
  end
  player_cards.each do |card|
    if card.last == SPECIAL_CARD && points["player"] > MAX_VALUE
      points["player"] -= 10
    end
  end
end

def determine_points_dealer(points, dealer_cards, hidden_card)
  points["dealer"] = 0
  if hidden_card == true
    points["dealer"] += VALUES[dealer_cards[0].last]
  else
    dealer_cards.each do |card|
      points["dealer"] +=	VALUES[card.last]
    end
    dealer_cards.each do |card|
      if card.last == SPECIAL_CARD && points["dealer"] > MAX_VALUE
        points["dealer"] -= 10
      end
    end
  end
end

def player_turn(player_cards, deck)
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
    false
  else
    true
  end
end

def dealer_turn(dealer_cards, deck, points)
  if points["dealer"] > MAX_VALUE
    return true
  elsif points["dealer"] < MIN_VALUE
    dealer_cards << deck.pop
  else
    return true
  end
  nil
end

def some_one_won?(points, round_end, deck)
  !!who_won?(points, round_end, deck)
end

def who_won?(points, round_end, deck)
  if deck_empty?(deck)
    return "Nobody"
  end
  if points["player"] > MAX_VALUE
    return "Dealer"
  elsif points["dealer"] > MAX_VALUE
    return "Player"
  end

  round_finished?(round_end, points)
end

def round_finished?(round_end, points)
  if round_end == true
    if points["dealer"] < points["player"]
      return "Player"
    elsif points["dealer"] > points["player"]
      return "Dealer"
    elsif points["dealer"] == points["player"]
      return "Nobody"
    end
  end

  nil
end

def new_round?
  new_round = ""
  loop do
    puts "Continue? (enter)"
    new_round = gets
    break if new_round == "\n"
    puts "Do you want to leave the round? (y/n)"
    new_round = gets.chomp.downcase.split("").first
    break if new_round == "y"
  end

  if new_round == "y"
    return true
  end

  nil
end

def mix_deck?
  new_round = ""
  loop do
    system "clear"
    puts "Mix the deck or quit the game? (m/q)"
    user_input = gets.chomp.downcase
    new_round = user_input.split("").first
    break if new_round == "m" || new_round == "q"
    puts "not valid input"
  end

  if new_round == "q"
    return true
  end

  nil
end

def deck_empty?(deck)
  if deck.size < 5
    return true
  end
  nil
end

# main code

system "clear"
puts "Welcome to twenty-one !"
sleep(2)

loop do
  deck = initialize_deck

  loop do
    player_cards = []
    dealer_cards = []
    points = { "player" => 0, "dealer" => 0 }

    hidden_card = true
    round_end = false

    give_cards(player_cards, dealer_cards, deck)

    determine_points_player(points, player_cards)
    determine_points_dealer(points, dealer_cards, hidden_card)

    loop do
      display_card_board(player_cards, dealer_cards, points, "Player", hidden_card, deck)

      stay = player_turn(player_cards, deck)

      determine_points_player(points, player_cards)

      break if stay || some_one_won?(points, round_end, deck) || deck_empty?(deck)
    end

    hidden_card = false

    loop do
      determine_points_dealer(points, dealer_cards, hidden_card)

      display_card_board(player_cards, dealer_cards, points, "Dealer", hidden_card, deck)

      break if some_one_won?(points, round_end, deck)

      sleep(2)

      stay = dealer_turn(dealer_cards, deck, points)

      determine_points_dealer(points, dealer_cards, hidden_card)

      display_card_board(player_cards, dealer_cards, points, "Dealer", hidden_card, deck)

      break if stay || some_one_won?(points, round_end, deck) || deck_empty?(deck)
    end

    if deck_empty?(deck)
      sleep(1)
      puts "Sorry... The deck has too few cards to continue playing :("
      sleep(2)
    end

    round_end = true

    puts "#{who_won?(points, round_end, deck)} won this round!!!"

    break if deck_empty?(deck)

    new_round = new_round?

    break if new_round
  end

  mix_deck = mix_deck?

  break if mix_deck
end

system "clear"
puts "Thanks for playing twenty-one!"
sleep(2)
