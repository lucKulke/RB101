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


Bonus 1 = Allows you to determine if the result of the division is an integer number (no remainder)

Bounus 2 = the factor in the last second-to-last line is important because thats the returning value of the method.

```ruby
# my solution 1.:
def factor(number)
  factoren = []
  divisor = number
  loop do 
    if number >0
    factoren << (number / divisor) if number%divisor == 0
    divisor -= 1
    break if divisor==0
    end
  end
  factoren
end

p result = factor(-2) 

# my solution 2.:
def factors(number)
  divisor = number
  factors = []
  begin
    if number >0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    else
      break
    end
  end until divisor == 0
  factors
end

p factors(-1)

# lauch school solution:
while divisor > 0 do
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end

```

### Question 4
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

answer: at the first method the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns. 


### Question 5

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

solution: he got an error becaue the method have no access to the variable limit. he have to initialize the variable limit inside the method.


### Question 6
What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

answer: 34

### Quesition 7
One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

answer: the munster hash has changed after the method call(mess_with_demographics). The method points to the same object_id as munster.

### Question 8

Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

solution: "paper"

### Question 9
What would be the return value of the following method invocation?

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)

```

solution: "no"