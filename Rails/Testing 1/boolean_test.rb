require "minitest/autorun"

class BooleanTest < Minitest::Test

	def test_true_is_true
		assert true
	end

	def test_false_isnt_true
		assert false, "True should be truthy"
	end
	
end