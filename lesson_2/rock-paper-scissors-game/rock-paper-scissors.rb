require "yaml"
MESSAGE = YAML.load_file('r-p-s-message.yml')

=begin
In this assignment, we'll build a Rock Paper Scissors game. The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed
=end

def promt(value)
  Kernel.puts(">> #{value}")
end
def valid_rematch?(value)
  "n" == value.to_s.downcase || "y" == value.to_s.downcase
end

  


VALUE = ["rock","paper","scissor"]

# set variables
promt(MESSAGE["welcome"]) 
promt(MESSAGE["rules"])


# start game loop
loop do
  round_count = 1
  player_wins = 0
  computer_wins = 0
  user_input = ""
  computer_choice = ""
  round_times_input=""
  
  
  # round times set
  loop do
    promt(MESSAGE["round_times"])
    round_times_input = Kernel.gets.chomp
  if round_times_input =~ /\A-?\d+\z/ 
      break
  else
      promt(MESSAGE["not_valid"])
  end
  end
  
  # start round loop
  loop do
    puts
    promt("Round #{round_count} started")
    puts
    
    # start user input loop (inkl. valid check)
    loop do
      promt(MESSAGE["rules_choice"])
      promt(MESSAGE["player_choice"])
      user_input = Kernel.gets.chomp
      break if VALUE.include?(user_input.downcase)
      promt(MESSAGE["not_valid"])
      end
      computer_choice = VALUE.sample()
      promt(MESSAGE["computer_choice"]+ " #{computer_choice}")
      puts
      

      # game logic
      if (user_input == VALUE[0] && computer_choice == VALUE[2]) ||
        (user_input == VALUE[1] && computer_choice == VALUE[0]) ||
        (user_input == VALUE[2] && computer_choice == VALUE[1])
        promt(MESSAGE["player_win"])
        player_wins += 1
      elsif computer_choice == user_input 
        promt(MESSAGE["pair"])
      else 
        promt(MESSAGE["computer_win"])
        computer_wins += 1
      end


      round_count += 1 # round of game
      puts
      
      # score table
      promt("Computer score | #{computer_wins}")
      promt("Your score     | #{player_wins}")
      
      # game winner 
      if player_wins > (round_times_input.to_i/2)
        puts
        promt(MESSAGE["player_won_game"])
        break
      elsif computer_wins > (round_times_input.to_i/2)
        puts
        promt(MESSAGE["computer_won_game"])
        break
      end
      
  end

  # rematch
  promt(MESSAGE["rematch"])
  rematch = Kernel.gets.chomp.downcase
  break if valid_rematch?(rematch) && rematch == "n"
  promt(MESSAGE["not_valid"])
end




