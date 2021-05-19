### Example 1
Take a moment to digest the following example:
```ruby
#Copy Code
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

What's happening in this, seemingly simple, piece of code? Take it apart and try to describe every interaction with precision.

answer: the method "each" is called on a nested array nested array [[1,2], [3,4]]. in each iteration the first element in the array 
is selected and from this selected array the first value is the printed element. the return value of each iteration is nil because "puts" always returns nil. The return value of the method each is the original array.

launchschool: The Array#each method is being called on the multi-dimensional array [[1, 2], [3, 4]]. Each inner array is passed to the block in turn and assigned to the local variable arr. The Array#first method is called on arr and returns the object at index 0 of the current array - in this case the integers 1 and 3, respectively. The puts method then outputs a string representation of the integer. puts returns nil and, since this is the last evaluated statement within the block, the return value of the block is therefore nil. each doesn't do anything with this returned value though, and since the return value of each is the calling object - in this case the nested array [[1, 2], [3, 4]] - this is what is ultimately returned.


### Example 3
Let's mix it up a little bit and have you try taking apart an example on your own.
```ruby
#Copy Code
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

Map out a detailed breakdown for the above example using the same approach as the previous two examples. What do you think will be returned and what will be the side-effects? You shouldn't have to guess; there is a right answer and you have all the knowledge necessary to take it apart. Take your time and be careful. Check the solution below once you have done this on your own.

answer: 
1. the method map is called on an nested array [[1,2], [3,4]]
2. the first subarray is assigned to the "arr" variable.
3. in the first line of the block is puts called on the first value of 
the subarray that is assigned to the "arr" variable.
4. puts print the value as a Stringelement
5. in the last line of the block the first value of the subarray is called.
6. that value is also the returnvalue of the block and that overrides the value in the subarray "arr".
7. then the next subarray on index[1] is assigned to "arr" and the second iteration will execute
8. the returnelement of map is an array with the values : [1, 3]



### Example 4
```ruby
#Copy Code
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

Can you take this code apart, just like before? What will be output and what will be the value of my_arr? Check the solution below once you have tried this on your own.

answer:
1. the method "each" is called on a nested array [[18, 7], [3, 12]]
2. the returnvalue of each is assigned to an variable ("my_arr")
3. the first subarray at index prosition [0] of the array is assigned to the variable "arr" 
4. in the block of the each method is called a second "each" method on the variable "arr"(that includes the first subarray of the master array)
5. the first value of that subarray is assigned to the variable "num"
6. a if statement is checking if the variable "num"(includes the first value of the subarray) is greater than 5
7. then puts print the variable num as a string element on the display
8. the puts method gives nil back but because "each" gives the original value that it is called that have no effect.
9. after the second iteration the method each gives the original array back.
10. the original array is assigned to "my_arr"




### Example 5
Next, let's tackle a slightly more complex example.
```ruby
#Copy Code
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

What will the return value be in this example? Use what you've learned so far to break it down on your own before checking the solution below.

answer:
1. map is called on a nested array. 
2. the first subarray of the master array is assigned to the variable "arr"
3. in the block of map is called a second map method on the subarray.
4. the first value of the subarray is assigned to the variable "num"
5. in the block of the second map method the "num" variable is doubled
6. so the return vlaue of the block from the second map method is the doubled value of "num"
7. the returnvalue of the second map method is a array with the value 2 and 4 [2,4]
8. that returnvalue is also the last expression of the outer block.
9. the first map method take last expression and give it back.
10. than the second iteration will execute with the difference that the second subarray is assigned to the variable "arr"
11. the total returnelement of the map method that is called on the nested array is [[2,4], [6,8]]



### Example 6
Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.
```ruby
Copy Code
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```
There's a lot going on here, but you now possess all the necessary knowledge to take this apart, line by line, letter by letter. We won't do a full table of steps like before, but see if you understand every line and every letter in the code above. If you do not, take your time and study it; you should be able to deconstruct this code to its core.

answer:
1. the method select is called on a array that includes two hashes.
2. the first element of the array is assigned to the variable "hash"
3. in the outer block is the method "all?" called on the variable "hash"
5. that method checks if the key and the first letter of the value are equal. if thats the case the method returns true. if not it returns false.
6. for the first hash the method returns false and select just return truthy values. 
7. on the second iteration select gives the second hash back because all key value pairs meet the requirements


### Example 10
Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.
```ruby
#Copy Code
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```
This example is more complicated than the rest, but at this point you should be able to break it down effectively. Use the tools you've learned about in this lesson and take as much time as needed. Work on breaking down each component and understanding the return value of each expression. What will be the final return value? Check the solution only after you've tried this on your own.


1. map is called on a triple nested array and the first inner array is assigned to the variable "arr"(contains now  [[1,2],[3,4]] )
2. in the outer block map is called on the variable "arr" and the first element of "arr" is assigned to the variable "el"(contains now [1,2])
3. "if" statement checks if the element converted to string size is equal to one. that statement checks if it is a array or a single interger.
4. "if" the element is just a interger and not an array the elment will increment by 1 and the returnvalue of the inner map is an new array with every interger of the original array incremented by one.
5. if thats not the case the element goes to "else". in the block of "else" map is called on the element and the first element is assigned to 
the variable "n". (contains now the interger 1)
6. each interger is increment by one 
7. the return value of map is a new array with every interger of the original array incremented by one.
8. if all iterations are completed the returnvalue of the first map method of the original array is 


