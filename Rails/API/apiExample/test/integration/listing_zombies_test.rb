require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest

	setup { host! 'api.apiexample-dev.com' } #This is required for subdomain tests

	test 'returns list of all zombies' do
		get '/zombies', {}, { "Accept" => Mime::JSON }
		assert_equal 200, response.status
		refute_empty response.body
	end

	test "returns zombies filtered by weapon" do
		john = Zombie.create!(name: 'John', weapon: 'axe')
		joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')

		get '/zombies?weapon=axe', {}, { "Accept" => Mime::JSON }
		assert_equal 200, response.status

		zombies = json(response.body) #def in helper
		names = zombies.collect { |z| z[:name] }
		assert_includes names, 'John'
		refute_includes names, 'Joanna'
	end

	test "returns zombie by id" do
		joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')
		get "/zombies/#{joanna.id}"
		assert_equal 200, response.status

		zombie_response = json(response.body) #def in helper
		assert_equal joanna.name, zombie_response[:name]
	end

	test "returns zombies in JSON" do
		get "/zombies", {}, { "Accept" => Mime::JSON }
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end

	test "returns zombies in XML" do
		get "/zombies", {}, { "Accept" => Mime::XML }
		assert_equal 200, response.status
		assert_equal Mime::XML, response.content_type
	end

end