require 'yaml'
MESSAGES = YAML.load_file('message_calculator.yml')

# is the number valid? is the operator valid?

def valid_number?(number)
  number.to_i != 0
end

def valid_operator?(operator)
  valid_number?(operator) && operator.to_i.between?(1, 4)
end

# funktion for display text and results

def promt(message)
  Kernel.puts("> #{message}")
end

def selected_operation_string(operator)
  case operator
    when "1"
      "adding"
    when "2"
      "subtracting"
    when "3"
      "muliplying"
    when "4"
      "divideing"
  end

end

# math functions (add,subtract,multiply,divide)

def add(num1, num2)
  return num1 + num2
end

def sub(num1, num2)
  num1 - num2
end

def multiply(num1, num2)
  num1 * num2
end

def divide(num1, num2)
  if num1 > 0 && num2 > 0
    num1 / num2
  else
    promt(MESSAGES['zero'])
  end
end

# calulator in a loop so that the user can do operations as many as he want.

quit = false

while quit == false #loop for quit the calculator
  user_input_first_number = ""
  user_input_second_number = ""
  user_input_operation = ""
  pormt_operator = <<-MSG
What operation would you like to perform?
   
   1) add
   2) subtract
   3) multiply
   4) divide

  MSG
  
  promt(MESSAGES['welcome'])
  
  loop do
    promt(MESSAGES['first_number'])
    user_input_first_number = Kernel.gets().chomp().to_i
    if valid_number?(user_input_first_number)
      break
    else
      promt(MESSAGES['valid_number'])
    end
  end

  loop do
    promt(MESSAGES['second_number'])
    user_input_second_number = Kernel.gets().chomp().to_i
    if valid_number?(user_input_second_number)
      break
    else
      promt(MESSAGES['valid_number'])
    end
  end

  loop do
    promt(pormt_operator)
    user_input_operation = Kernel.gets.chomp
    if valid_operator?(user_input_operation)
      break
    else
      promt(MESSAGES['valid_operator'])
    end
  end

  promt("#{selected_operation_string(user_input_operation)} the two numbers..")
  
  case user_input_operation
  when "1"
    promt(">> #{add(user_input_first_number, user_input_second_number)}")
  when "2"
    promt(">> #{sub(user_input_first_number, user_input_second_number)}")
  when "3"
    promt(">> #{multiply(user_input_first_number, user_input_second_number)}")
  when "4"
    promt(">> #{divide(user_input_first_number.to_f, user_input_second_number.to_f)}")
  else promt(MESSAGES['operation_wrong'])
  end

  # loop for question if the user calculate again or quit.
  loop do
    promt(MESSAGES['new_calculation'])
    user_input_loop = Kernel.gets().chomp().downcase
    if user_input_loop == "y"
      promt("ok")
      break
    elsif user_input_loop == "n"
      return quit = true
    else
      promt(MESSAGES["new_calculation_error"])
    end
  end
end
