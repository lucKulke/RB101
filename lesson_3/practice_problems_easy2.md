
### Question 1
In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
see if "Spot" is present.

solution: 

1. ages.include?("Spot")
2. present = true
ages.each do |key,value|
  if (key || value) == "Spot"
    present = true
  else 
    present = false
  end
end
p present
3. ages.key?("Spot")
4. ages.member?("Spot")


### Question 3
Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

Convert the string in the following ways (code will be executed on original munsters_description above):

1."tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
2."The munsters are creepy in a good way."
3."the munsters are creepy in a good way."
4."THE MUNSTERS ARE CREEPY IN A GOOD WAY."


1. munsters_description.upcase!
munsters_description[0] = "t"
munsters_description[4] = "m"
p munsters_description
1.1 munsters_description.swapcase!

2. split_munsters_description = munsters_description.split
split_munsters_description[1] = split_munsters_description[1].downcase
p munsters_description = split_munsters_description.join(" ")

2.1 munsters_description[4] = "m" 
2.2 munsters_description[4] = munsters_description[4].downcase
2.3 munsters_description.capitalize!

3. munsters_description.downcase!

4. munsters_description.upcase!


### Question 3
We have most of the Munster family in our age hash:

Copy Code
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
add ages for Marilyn and Spot to the existing hash

Copy Code
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

solution: ages.merge!(additional_ages)


### Question 4
See if the name "Dino" appears in the string below:

Copy Code
advice = "Few things in life are as important as house training your pet dinosaur."

solution:
advice.include?("Dino")
advice.match?("Dino")

(Note that this is not a perfect solution, as it would match any substring with Dino in it.)

### Question 5

Show an easier way to write this array:

Copy Code
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

solution flintstone = w%(Fred Barney Wilma Betty BamBam Pebbles)

### Question 6

How can we add the family pet "Dino" to our usual array:

Copy Code
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

solution: 
flintstones.push("Dino")
flintstones << "Dino"

### Question 7
In the previous practice problem we added Dino to our array like this:

Copy Code
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
We could have used either Array#concat or Array#push to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

solution:
flintstones.push("Dino", "Hoppy")
flintstones.concat(["Dino", "Hoppy"])


### Question 8
Shorten this sentence:

Copy Code
advice = "Few things in life are as important as house training your pet dinosaur."

...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?

solution:
advice = advice.split.slice!(0, 8).join(" ")

launch school solution: 
advice.slice!(0, advice.index("house")


### Question 9

Write a one-liner to count the number of lower-case 't' characters in the following string:

Copy Code
statement = "The Flintstones Rock!"

solution: 
statement.count("t")

### Question 10

Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

Copy Code
title = "Flintstone Family Members"


solution:
char_count = title.split("").count
(40 - char_count) / 2 #that number of spaces from begin of the page

launch school solution: 
title.center(40) # return => <p> "-------Flintstone Family Members-------" </p>
