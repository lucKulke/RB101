### Question 1
Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

Copy Code
```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```
```ruby
# solution:

space = ""
string = "The Flintstones Rock!"
10.times{
  puts space + string
  space += " "
   }

# launch school solution: 
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
```

### Question 2
The result of the following statement will be an error:

Copy Code
puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?

answere: the error appears because we can't add a string and a integer.
solution:
```ruby
puts "the value of 40 + 2 is #{40+2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
```


### Question 3
Alan wrote the following method, which was intended to show all of the factors of the input number:

Copy Code
```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```
Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1
What is the purpose of the number % divisor == 0 ?

Bonus 2
What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?


