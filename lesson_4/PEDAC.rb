

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


# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array


=end



# my soulution:

      
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