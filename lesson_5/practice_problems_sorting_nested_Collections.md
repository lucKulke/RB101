### Practice Problem 1
How would you order this array of number strings by descending numeric value?
```ruby
Copy Code
arr = ['10', '11', '9', '7', '8']
```

answer:
ascending numeric value =

```ruby
arr.sort{|a,b| a.to_i<=>b.to_i}

#or

sort_arr = arr.map{|num| num.to_i}.sort.map{|num| num.to_s}
```

descending numeric value =
```ruby
arr.sort{|a,b| b.to_i<=>a.to_i}
```

### Practice Problem 2
How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

Copy Code
```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
```

answer: 
```ruby
books.sort_by!{|hash| hash[:published]}
```

### Practice Problem 3
For each of these collection objects demonstrate how you would reference the letter 'g'.

Copy Code
```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

```

answer: 

```ruby
p arr1[2][1][3]
p arr2[1][:third].first # or [0]
p arr3[2][:third][0][0].split.first
p hsh1["b"][1]
p hsh2[:third].key(0)
```

### Practice Problem 4
For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

Copy Code
```ruby
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
```

answer:
```ruby
arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4
```


### Practice Problem 5
Given this nested Hash:

Copy Code
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
figure out the total age of just the male members of the family.

```

answer: 
```ruby
total_age = 0
munsters.each do |k,v|
	total_age += v["age"] if v["gender"] == "male"
end
p total_age
```


### Practice Problem 6
One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

Copy Code
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
...like this:

Copy Code
```ruby
(Name) is a (age)-year-old (male or female).
```

answer:
```ruby
munsters.each do |k,v|
	puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}"
end
```

launchschool answer:
```ruby
munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end
```


### Practice Problem 7
Given this code, what would be the final values of a and b? Try to work this out without running the code.

Copy Code
```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```

answer:
a = 2
b = [3,8]



### Practice Problem 8
Using the each method, write some code to output all of the vowels from the strings.

Copy Code
```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```

answer:
```ruby
vokale = %w(a e i o u)

hsh.each do |k,v|
	v.each do |string|
		string.split("").each do |char|
			puts char if vokale.include?(char)
		end
	end
end
```

launchschool: 
```ruby
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
```

### Practice Problem 9
Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

Copy Code
```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

answer:
```ruby
sort_array = arr.map do |sub_array|
	sub_array.sort{|a,b| b<=>a}
end
```


### Practice Problem 10
Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

Copy Code
```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

answer:
```ruby
new_array = array.map do |hash|
	hash.each_with_object({}) do |(k,v),hash|
		hash[k] = v +=1
	end
end
```


### Practice Problem 11
Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

Copy Code
```ruby
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
```

answer:
```ruby
new_arr = arr.map do |sub_arr|
	sub_arr.select do |num|
		num%3 == 0
	end
end
```


###  Practice Problem 12
Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

Copy Code
```ruby
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

```

answer:
```ruby
new_hash = arr.each_with_object({}) do |value,hash|
	hash[value.first] = value[1]
end
```


### Practice Problem 13
Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

Copy Code
```ruby
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

#The sorted array should look like this:

[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

answer: 
```ruby
sort_array = arr.sort do |a,b|
	a.select{|num| num.odd?}<=>b.select{|num| num.odd?}
end

#or

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```


### Practice Problem 14
Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

Copy Code
```ruby
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
hsh = {
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
```
The return value should look like this:

Copy Code
```ruby
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```


answer:
```ruby
new_array = hsh.each_with_object([]) do |(k,v),array|
	if v[:type] == "fruit"
		array << v[:colors].map{|string| string.capitalize}
	elsif v[:type] == "vegetable" 
		array << v[:size].upcase
	end
end

#or

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```


### Practice Problem 15
Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

Copy Code
```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
```

answer:
```ruby
new_arr = arr.select do |hash|
	hash.all? { |k,v| v.all?{|num| num.even?}}
end
```


### Practice Problem 16
A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.


answer:
```ruby
def uuid_creater
	uuid = ""
	uuid << SecureRandom.hex(4)
	uuid << "-"
	3.times{
		uuid << SecureRandom.hex(2)
		uuid << "-"
	}
	uuid << SecureRandom.hex(6)
	uuid
end
```
or 
```ruby
def uuid_creater
	uudi = [0,0,0,0,0,0,0,0,"-",0,0,0,0,"-",0,0,0,0,"-",0,0,0,0,"-",0,0,0,0,0,0,0,0,0,0,0,0]
	return_uudi = uudi.map do |value|
		if value.is_a?(Integer)
			random_char = ("a".."z").to_a.sample
			random_number = rand(1..9)
			value = [random_char,random_number].sample
		end
		value
	end
	return_uudi.join		
end
```
or launchschool solution
```ruby
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
```
