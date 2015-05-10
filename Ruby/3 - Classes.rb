#Inheritance

class Attachment 
	attr_accessor :title, :size, :url
	def to_s
		"#{@title}, #{@size}"
	end
end 

class Image < Attachment
end

class Video < Attachment
	attr_accessor :duration
end

#Base call is super

class User 
	def initialize(name)
		@name = name
	end
end

class Follower < User
	def initialize(name, following)
		@following = following
		super(name) #It's actually like calling the base constructor
	end
	def relationship
		"#{@name} follows #{@following}"
	end
end

follower = Follower.new("Thor", "Spider-man")
puts follower.relationship

#You can use super on method 

class Grandparent 
	def speak(argument)
		"I'm grandparent #{argument}"
	end
end

class Parent < Grandparent
end

class Child < Parent
	def speak(argument)
		super + "\nI'm child #{argument}" #super call the same method in parent and then grandparent. Used as a keywork it just passed the same argument
	end
end 

grandparent = Grandparent.new 
puts grandparent.speak("Martin")
child = Child.new 
puts child.speak("Tom")