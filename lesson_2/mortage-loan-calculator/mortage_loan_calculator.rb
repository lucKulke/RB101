#funktion
def valid_number_i?(num)
  if num.to_s.to_i == num
    return true
  end
end

def valid_number_f?(num)
  if num.to_s.to_f == num
    return true
  end
end

#input variables
loan_amount_input = nil
loan_duration_input = nil
annua_percentage_rate_input = nil


#calculator
loop do
  puts "enter the loan amount (der Darlehensbetrag)"
  loan_amount_input = Kernel.gets.chomp.to_i
  if valid_number_i?(loan_amount_input) == true
    break
  end
  puts "your number is not valid"
end

loop do 
  puts "enter the annual percentage rate (jährliche Prozentsatz)"
  annua_percentage_rate_input =Kernel.gets.chomp.to_f
  if valid_number_f?(annua_percentage_rate_input) == true
    break
  end
  puts "your number is not valid"
end

loop do 
  puts "enter the loan duration in months(die Darlehenslaufzeit in Monaten)"
  loan_duration_input = Kernel.gets.chomp.to_i
  if valid_number_i?(loan_duration_input)
    break
  end
  puts "your number is not valid"
end

def mortage_loan(loan_amount, annua_percentage_rate, loan_duration)
  monthly_interest_rate = (annua_percentage_rate/12)/100
  return monthly_paymaent = loan_amount * (monthly_interest_rate / (1-(1+monthly_interest_rate)**(-loan_duration)))
end

puts "your monthly payment is:#{mortage_loan(loan_amount_input,annua_percentage_rate_input,loan_duration_input)}"

