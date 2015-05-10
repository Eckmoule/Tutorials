#Optional arguments 

def tweet(message, lat = nil, long = nil)
	puts message 
end

tweet("Success 1")

#Hash arguments for long declaration

def tweet2(message, options = {})
	lat = options[:lat] || ""
	long = options[:long] || ""
	puts message + lat + long
end
tweet2("Success", :lat => " 2", :long => " !")
tweet2("Success", lat: " 3", long: " !")
tweet2("Success 4")

#Exceptions

def TestException(message)
	unless message
		raise Exception.new
	else
		message
	end
end

begin
	puts TestException(nil)
rescue Exception
	warn "list is not defined"
end

begin
	puts TestException("Success 5")
rescue Exception
	warn "list is not defined"
end

#Splat argument (The parameter is an array)

def tweet3(status, *messages)
	puts "#{messages.join(' ')} #{status}"
end

tweet3("Success 6", "Test", "Test2")
tweet3("Success 7", "toto", "tata", "titi")
tweet3("Success 8")

#Classes 

class Name 
	def initialize(first, last = nil)
		@first = first
		@last = last
	end
	def format
		[@last, @first].compact.join(", ")
	end
end

user_names = []
user_names << Name.new("Ashton", "Kutcher")
user_names << Name.new("Wil", "Wheaton")
user_names << Name.new("Madonna")
user_names.each { |n| puts n.format }

class Tweet 
	attr_accessor :satus #attr_accessor creates getters and setters
	attr_reader :created_at #only getters for this one 
	def initialize(status)
		@status = status
		@created_at = Time.new
	end
end

tweet = Tweet.new("My status")
puts tweet.to_s

#Ruby allows you to reopen any class 

class Tweet
	def to_s
		"#{@status}\n#{@created_at}"
	end
end

puts tweet.to_s

#Self keyword

class UserList
	attr_accessor :name
	def initialize(name)
		self.name = name #Like this 
	end
end

puts UserList.new("Success 9").name