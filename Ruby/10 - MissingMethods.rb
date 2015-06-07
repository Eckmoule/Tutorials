#Ruby call a method_missing method every time a non existing method get called
#We can define this method in our object 

class Tweet 
	def method_missing(method_name, *args)
		puts "You tried to call #{method_name} with these arguments: #{args}"
	end
end

Tweet.new.submit(1, "Test");

#It's possible to use this technique to delegate every missing call to another class (in a refactoring process I guess)

class Momo 
	DELEGATED_METHODS = [:username, :avatar]

	def initialize(user)
		@user = user
	end

	def method_missing(method_name, *args)
		if DELEGATED_METHODS.include?(method_name)
			@user.send(method_name, *args)
		else
			super #default handling
		end
	end
end

#You can delegate everything by using the simpledelegator
require 'delegate'

class Toto < SimpleDelegator 
	def initialize(user)
		super(user)
	end
end

#This can also be used to create dynamic methods

class Moko 
	def method_missing(method_name, *args)
		match = method_name.to_s_match(/^hash_(\w+)/) #regular expression for hash_[...]
		if match 
			@text << " #" + match[1]
		else
			super
		end
	end
end

#We can also use a method named respond_to? to check if a method exist

moko = Moko.new
puts moko.respond_to?(:test)