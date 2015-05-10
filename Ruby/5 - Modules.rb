module Helper
	def self.GiveMeSuccess
		puts "Success"
	end
end

Helper.GiveMeSuccess

#A module can be included in a class (extend class functions)
#This behavior can sometime be better than inheritance (if it's not a specialization)
#You can also add more than one (not the case for inheritance)

module Success 
	def GiveMeSuccess 
		puts "Success"
	end
end

class Image 
	include Success #Include for instance method
end

class Tweet 
	extend Success #Extend for class method
end

class Post 
end

image = Image.new
image.GiveMeSuccess #instance methods
Tweet.GiveMeSuccess #class method
post = Post.new
post.extend(Success) #Class method only for this instance
post.GiveMeSuccess 

#You can also have both class and instance method in the same module

module Test
	def self.included(base)
		base.extend(ClassMethods) #this is called by ruby when a module is included
		base.CallMeOnClass("Success")
	end

	def CallMe
	end

	module ClassMethods #The name ClassMethods is a convention
		def CallMeOnClass(message)
			puts message
		end
	end
end

class Me 
	include Test
end

me = Me.new

#Rewrite with activesupport

require 'active_support/concern'

module HeyMan
	extend ActiveSupport::Concern #Will look for ClassMethods to extend

	included do #Active support feature
		CallMeOnClass("Success") 
	end

	def CallMe
	end

	module ClassMethods #The name ClassMethods is a convention
		def CallMeOnClass(message)
			puts message
		end
	end
end

class Hey
	include HeyMan
end

hey = Hey.new