require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  
	def setup
		@z = zombies(:Yohan)
	end

  	test "valid with all attributes" do
		assert @z.valid?, "Zombie was not valid"
	end

	test "invalid name gives error message" do
		@z.name = nil
		assert_presence(@z, :name) #we created it in test_helper
	end

	test "invalid graveyard gives error message" do
		@z.graveyard = nil
		#assert_presence(@z, :graveyard) #we created it in test_helper
		
	end

	should validate_presence_of(:graveyard) #this use shoulda in gemfile

	test "can generate avatar_url" do
		assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
	end

	test "should respond to tweets" do
		assert_respond_to @z, :tweets
	end

	test "should contains only tweets that belongs to zombie" do
		assert @z.tweets.all? {|t| t.zombie == @z}
	end

	#trying to use mocks and stubs (use the mocha GEM)

	test "decapitate should set graveyard to dead again" do
		@z.decapitate
		assert_equal "dead again", @z.graveyard
	end

	test "decapitate should set graveyard to dead again with stub" do
		#Fake method that going to return null
		#This way if there is an error in the slice method that's not going to modify this test result. Here we just want to check the graveyard change.   
		@z.weapon.stubs(:slice)  
		@z.decapitate
		assert_equal "dead again", @z.graveyard
	end

	test "decapitate should set graveyard to dead again with mock" do
		#Same thing but also verify the call is being done
		@z.weapon.expects(:slice)  
		@z.decapitate
		assert_equal "dead again", @z.graveyard
	end

	test "geolocate calls graveyard_locator with params and return" do
		#This create a fake return object for the function
		loc = stub(latitude: 2, longitude: 3)
		@z.weapon.expects(:graveyard_locator).with(@z.graveyard)
		.returns(loc)
		assert_equal "2, 3", @z.geolocate
	end
end
