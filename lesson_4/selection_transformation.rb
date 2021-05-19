my_numbers = [1, 4, 3, 7, 2, 6]




def multiply(arr,num)

  result_arr = []
  arr.each do |n|
  	result_arr << (n * num)
  end
  result_arr


end





p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]




