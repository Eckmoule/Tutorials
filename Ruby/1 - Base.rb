#If syntax

if 1 == 1
	puts "Success 1"
end 

if 1 == 2 
	puts "Failure"
else
	puts "Success 2"
end

if 1 == 2 
	puts "Failure"
elsif 1 == 1
	puts "Success 3"
end

unless 1 == 2
	puts "Succees 4"
end

#Nil is treated as false in ruby 
	#if Test != null 
	#Can be done 
	#if Test 

#Other values are true
# "" == true 
# 0 == true
# [] == true

#Inline if 

puts "Success 5" if 1 == 1
puts "Success 6" unless 1 == 2

#Assigment with condition

result = "Success 7" || "Failure"
puts result

result = nil || "Success 8"
puts result

result = "Success 9"
result ||= "Failure"
puts result

result = nil
result ||= "Success 10"
puts result

#Even to call function function1 || function2

#The if return the result

result = if 1 == 1
	"Success 11"
else
	"Failure"
end
puts result 

def Test(user)
	if user
		"User is defined"
	else
		"User isn't defined"
	end
end
puts Test(nil)

#Same for case 

result = case result
when "Failure"
	"Failure loop"
when "Success 11"
	"Success 12"
else
	"Failure"
end
puts result

#Test range 

test = 5
case test
when 0..3
	puts "Failure"
when 3..6
	puts "Success 13"
else
	puts "Failure"
end

case test
when 0..3 then
	puts "Failure"
when 3..6 then
	puts "Success 14"
else
	puts "Failure"
end

search = "" unless search
puts search