#for data object you can use struct (if there is to many method it's probably a class)

Tweet = Struct.new(:user, :status) do 
	def to_s
		"#{user}- #{status}"
	end
end

class Test 
	def draft
		@status = :draft 
	end

	def posted
		@status = :posted 
	end

	def deleted
		@status = :deleted 
	end
end

#This can be rewrite with define_method (methods created dynamically)

class Test2
	states = [:draft, :posted, :deleted]
	states.each do |status|
		define_method status do
			@status = status
		end
	end
end

#It's possible to call private methods with send

class Test3
	private 
	def CallMe
		puts "Success 1"
	end
end

test = Test3.new
test.send("CallMe")
test.send(:CallMe)