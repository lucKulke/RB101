# funktions (add,subtract,multiply,divide)

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
    result = num1 / num2
  else
    puts "you can't divide by zero"
  end
end

# calulator in a loop so that the user can do operations as many as he want.

quit = false

while quit == false
  puts "the calculator is ready"
  puts "enter first number"
  user_input_first_number = Kernel.gets().chomp().to_i
  puts "enter second number"
  user_input_second_number = Kernel.gets().chomp().to_i
  puts "which operation should the calculator perform?(add, sub, multiply, divide)"
  user_input_operation = Kernel.gets.chomp

  if user_input_operation == "add"
    Kernel.puts(">> #{add(user_input_first_number, user_input_second_number)}")
  elsif user_input_operation == "sub"
    Kernel.puts(">> #{sub(user_input_first_number, user_input_second_number)}")
  elsif user_input_operation == "multiply"
    Kernel.puts(">> #{multiply(user_input_first_number, user_input_second_number)}")
  elsif user_input_operation == "divide"
    Kernel.puts(">> #{divide(user_input_first_number, user_input_second_number)}")
  else Kernel.puts("your operation dont exist")   
  end

  Kernel.puts("do you want to calculate something else?(y/n)")
  user_input_loop = Kernel.gets().chomp().downcase
  if user_input_loop == "y"
    Kernel.puts("ok")
  elsif user_input_loop == "n"
   return quit = true
  else 
    Kernel.puts("your input is not valid. type 'y' for yes and 'n' for no.")
  end
end
