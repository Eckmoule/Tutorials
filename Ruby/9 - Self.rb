#It's possible to modify the content of a class without reopenng it by using class_eval

class Test 

	attr_accessor :status, :created_at

	def initialize(status)
		@status = status
		@created_at = Time.now
	end

end

Test.class_eval do 
	attr_accessor :user
end

test = Test.new("Hey status")
test.user = "The class now have a user attribute, thanks to the class_eval"
puts test.user

#Can be use to redefine methods from class 

class Tweet 
	def say_hi
		puts "Hi"
	end
end

class MethodLogger
	def log_method(klass, method)
		klass.class_eval do
			alias_method "#{method}_original", method #Save the original method with alias 
			define_method method do #redefine a new method
				puts "#{Time.now}: Called #{method}"
				send "#{method}_original" #call the original
			end
		end
	end

	#Same with params
	def log_method_params(klass, method)
		klass.class_eval do
			alias_method "#{method}_original", method #Save the original method with alias 
			define_method method do |*args, &block| #redefine a new method
				puts "#{Time.now}: Called #{method}"
				send "#{method}_original", *args, &block #call the original
			end
		end
	end
end

tweet = Tweet.new 
tweet.say_hi
MethodLogger.new.log_method(Tweet, :say_hi)
tweet.say_hi

