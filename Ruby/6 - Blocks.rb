words = ['Success', ' 1', ' !'];
words.each { |word| puts word }
words.each do |word|
	puts word
end

def call_this_block_twice
	yield
	yield
end

call_this_block_twice { puts "Success 2" }

#blocks with argument

def call_this_block 
	yield "Success 3"
end	

call_this_block {|myargs| puts myargs.upcase }

def puts_this_block 
	puts yield
	puts yield
end

puts_this_block { "Success 4" }

#This behavior can be used to refactor lots of code

def play
	emulate do |emulator|
		emulator.play(self)
	end
end

def screenshot
	emulate do |emulator|
		emulator.start(self)
		emulator.screenshot
	end
end

private 
def emulate
	begin
		emulator = Emulator.new(system)
		yield emulator
	rescue Exception => e
		puts "Emulator failed: #{e}"
	end
end