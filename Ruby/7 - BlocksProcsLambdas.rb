proc = Proc.new { puts "Success 1" }
proc.call

proc = Proc.new do
	puts "Success 2"
end
proc.call

proc = lambda { puts "Success 3" }
proc.call

proc = -> { puts "Success 4" }
proc.call

#This way you can pass multiple proc to something and execute them at different moment
def post(success, error)
	if(1 == 1)
		success.call
	else
		error.call
	end
end

print = lambda { |tweet| puts tweet }

tweets = ["Toto", "Tata"]
tweets.each(&print) #The & turns a proc into a block, each is wainting for a block
#This is also working the other way around

tweets.map { |tweet| tweet.capitalize }
#Can be write (this is calling capitalize for every tweet)
tweets.map(&:capitalize)

#Optional block 

def print
	if block_given?
		puts "Block given"
	else
		puts "No block given"
	end
end 

print()
print { 1 == 1 }