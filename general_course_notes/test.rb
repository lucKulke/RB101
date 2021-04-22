# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


=begin
  
  rules: palindrome strings must be case sensetive

 create a method that checks if a substring is a palindrom
 create array with all substrings of the original string
 iterate over this new array
 if substring is a palindorme
  push substring in result array
 return result array



=end





      
def palindrome(string)
  string == string.reverse
end

def substring(string)
  result_array = []
  arr = string.split("")
  count = 0
  count2 = 0
  arr.each do |char|
    count = count2
    loop do
      result_array << arr[count2..count].join 
      count +=1
      break if count == arr.size
    end
    count2 +=1
    
  end
  result_array
end


def palindrome_substrings(string) 
  result_array = []
  arr = substring(string)
  arr.each do |word|
    if palindrome(word) && word.size >= 2
      result_array << word
    end
  end
  result_array

end

p palindrome_substrings("hahahlkko")