### Question 1
What would you expect the code below to print out?
=begin
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
=end

solution: the code prints 1 2 2 3 . because uniq() creates
a new array with the uniq values inside and dont midify numbers. Also puts() automaticly calls to_s() method on the given value in contrast to p(). p() calls the inspect() method automaticly on the give value.


### Question 2
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? : before something
5. put ? after something
6. put !! before something, like !!user_name

solution: 
1. != means unequal. we should use it in a expression.
2. ! before some is used to turn any object into the opposite of their boolean equivalent.
3. ! after something is not Ruby syntax but programer do that to show that the method mutate the caller so the given object changes.(it don't crate a new object)
4. ? : its a tenary operator.
5. not ruby syntax
6. !! before object is used to turn any object into their  boolean equivalent. 

### Question 3
Replace the word "important" with "urgent" in this string:

=begin
advice = "Few things in life are as important as house training your pet dinosaur."
=end

my solution: 
=begin

advice = "Few things in life are as important as house training your pet dinosaur."
advice =advice.split
advice.map! {|word| word == "important" ? "urgent" : word }
advice = advice.join(" ")

=end

launchshool solution: 

=begin
advice.gsub!('important', 'urgent')
=end


### Question 4
The Ruby Array class has several methods for removing items from the array. 
Two of them have very similar names. Let's see how they differ:

What do the following method calls do (assume we reset numbers to the original array between method calls)?

=begin 
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers.delete(1)
=begin

1. delete_at(1) means that the method deletes at index [1] the value in the array
2. delete(1) means that the method deletes the value 1 in the array
both do not return a modified array. both return the same object with modified values inside.

### Question 5
Programmatically determine if 42 lies between 10 and 100.

my solution: 42.between?(10,100)
launchshool solution: (10..100).cover?(42)

### Question 6
show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

solution:
1. "Four score and " + famous_words

2.  famous_words.prepend("Four score and ")


### Question 7
Make this into an un-nested array.

flintstone = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

solution:
flintstone.flatten!

### Question 8
Given the hash below:#

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

Turn this into an array containing only two elements: Barney's name and Barney's number.

my solution: flintstones = flintstones.to_a.delete_at(2)
launchschool solution: flintstones.assoc("Barney")
