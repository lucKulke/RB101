def repeatedString(s, n)
    count_a = 0
    loop do 
      s += s
      break if s.length >= n
    end
    arr_a = s.split("")[0..n]
    arr_a.each do |char|
      if char == "a"
        count_a +=1
      end
    end
    count_a

end

p repeatedString("abab",10**6)