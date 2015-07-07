require "minitest/autorun"

class String 
	def is_number? 
		self =~ /^\d+$/
	end

	def humanize
		if self =~ /zombie/
			raise RuntimeError
		else
			self.downcase.capitalize
		end
	end
end

class StringExtensionTest < Minitest::Test

	def test_is_number
		assert "3".is_number?
	end

	def test_is_not_number
		assert !"Blah".is_number?
	end

	#Test existence of the function
	def test_humanize_function_added_to_string
		assert_respond_to "blah", :humanize
	end

	def test_humanize_returns_something
		refute_nil "Yo".humanize, "humanize is returning nil"
		#assert_not_nil for default 
	end

	def test_humanize
		assert_equal "Likes me brains!", "LIKES ME BRAINS!".humanize
	end

	def test_just_for_brains
		assert_match /brains/, "LIKES ME BRAINS!".humanize
	end

	#Doesn't work with minitest ? 
	def test_zombie_in_humanize_raises_error
		assert_throws(RuntimeError) { "zombie".humanize }
	end

end