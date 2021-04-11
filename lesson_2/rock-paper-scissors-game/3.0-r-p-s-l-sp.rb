H_CHOICES = {rock: "r", paper: "p", scissor: "s", lizard: "l", spock: "sp"}
A_CHOICES = %w(r p s l sp)
A_CHOICES_PRINT = %w(rock paper scissor lizard spock)



#funktions
def promt(value)
  puts ">#{value}"
end

def valid_number?(number)
  number =~ /\A-?\d+\z/ 
end

def valid_player_choice?(input)
  input == input.to_s && A_CHOICES.include?(input)
end

def valid_rematch?(rematch)
  (rematch.downcase == "n" || rematch.downcase == "y") && rematch.to_s == rematch
end
    


#game logic
def win?(player, computer)
  if (player == H_CHOICES[:rock] && (computer == H_CHOICES[:scissor] || computer == H_CHOICES[:lizard])) ||
    (player == H_CHOICES[:scissor] && (computer == H_CHOICES[:paper] || computer == H_CHOICES[:lizard])) ||
    (player == H_CHOICES[:paper] && (computer == H_CHOICES[:rock] || computer == H_CHOICES[:spock])) ||
    (player == H_CHOICES[:lizard] && (computer == H_CHOICES[:spock] || computer == H_CHOICES[:paper])) ||
    (player == H_CHOICES[:spock] && (computer == H_CHOICES[:scissor] || computer == H_CHOICES[:rock]))
    "player won"
  
  elsif player == computer
    "its a pair"
  
  else 
    "computer won"
  end
end

# main code
promt("Welcome to the game")

loop do 
  
  player_choice = ""
  computer_choice = ""
  rounds = 1
  user_input_min_wins = 0
  player_score = 0
  computer_score = 0
  rematch = ""
  promt_rules = <<-MSG
here are the rules:

  Scissors cuts Paper 
  covers Rock 
  crushes Lizard 
  poisons Spock 
  smashes Scissors 
  decapitates Lizard 
  eats Paper 
  disproves Spock 
  vaporizes Rock  
  crushes Scissors.

  for Lizard type : l
  ____________________
  for Sock type   : sp
  ____________________
  for Rock type   : r
  ____________________
  for Scissor type: s
  ____________________
  for Paper type  : p
  
MSG

  
  
  loop do  # set minmal victories to win the game
    promt("how many victories to win?")
    user_input_min_wins = gets.chomp 
    break if valid_number?(user_input_min_wins)
    promt("not valid input")
  end
  
  loop do # round loop  
    
    loop do # set player choice and check if valid choice?
      promt("round #{rounds}. #{promt_rules}")
      puts
      player_choice = gets.chomp
      break if valid_player_choice?(player_choice)
      promt("not valid input")
    end
    
    puts
    
    # set computer choice and set the printable choice
    computer_choice_print = A_CHOICES_PRINT.sample
    computer_choice = computer_choice_print[0]
    promt("computer choose #{computer_choice_print}")
    
    puts

    # display who win the round
    p win_result = win?(player_choice.downcase, computer_choice.downcase)
    
    # set score for player and computer
    if win_result == "player won"
      player_score += 1
    elsif win_result == "computer won"
      computer_score += 1
    end
    
    puts
    
    # display table with actual scors
    puts "computer wins | #{computer_score}"
    puts "player wins   | #{player_score}"

    # escape from loop when the player or computer has reached the minimum number of wins
    break if player_score == user_input_min_wins.to_i || computer_score == user_input_min_wins.to_i
    
    rounds += 1
  
  end
  
  # display who won the game
  if player_score < computer_score
    promt("computer won!!!")
  else
    promt("player won!!!")
  end
  
  # rematch loop
  loop do
    promt("rematch? (y/n)")
    rematch = gets.chomp
    break if valid_rematch?(rematch)
    promt("not valid")
  end
  
  break if rematch.downcase == "n"
  promt("new round")

end
