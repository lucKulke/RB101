
### Practice Problem 1
What is the return value of the select method below? Why?

Copy Code
```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

```

answer: the method returns the original array because "hi" is always truethy [1,2,3]


### Practice Problem 2
How does count treat the block's return value? How can we find out?

Copy Code
```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
```

answer: the count method counts the number of elements for which the block returns a true value.


### Practice Problem 4
What is the return value of each_with_object in the following code? Why?

Copy Code
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
answer: the method each_with_object returns the given object({}) which was modifyed through the block.
		in the given object is now {"a" => "ant","b" => "bear","c" => "cat"}



--------------------------------------------------------------------------------

## Practice Problems: Aditional Practice


### Practice Problem 1
Given the array below

Copy Code
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

solution:
```ruby
x = 0

return_hash = flintstones.each_with_object({}) do |value,hash|
													hash[value] = flintstones.index(value)
													x+=1
												end


```


### Practice Problem 2
Add up all of the ages from the Munster family hash:

Copy Code
```ruby

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

solution:
```ruby
sum = 0
ages.each do |k,v|
	sum +=v
end
```

### Practice Problem 3
In the age hash:

Copy Code
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

remove people with age 100 and greater.

solution:
```ruby
ages.keep_if {|_,v| v < 100}

```


### Practice Problem 4
Pick out the minimum age from our current Munster family hash:

Copy Code
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

solution:
```ruby
min_age = ages.values.first
ages.each do |_,v|
	min_age = v if min_age > v
end
p min_age


alternative = ages.values.min
```

### Practice Problem 5
In the array:

Copy Code
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
Find the index of the first name that starts with "Be"

solution:
```ruby
ind = 0
flintstones.each_with_index do |v,i|
	if v.include?("Be")
		ind = i 
		break
	end
end



alternative = flintstones.index { |name| name[0, 2] == "Be" }
```


### Practice Problem 6
Amend this array so that the names are all shortened to just the first three characters:

Copy Code
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```





