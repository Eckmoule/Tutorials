require 'test_helper'

class ListingHumansTest < ActionDispatch::IntegrationTest

	setup { host! 'api.apiexample-dev.com' } #This is required for subdomain tests

	test "return list of humans in english" do
		get "/humans", {}, { "Accept-Language" => "en", "Accept" => Mime::JSON }
		assert_equal 200, response.status
		humans = json(response.body)
		assert_equal "Watch out for #{humans[0][:name]}!", humans[0][:message]
	end

	test "return list of humans in french" do
		get "/humans", {}, { "Accept-Language" => "fr", "Accept" => Mime::JSON }
		assert_equal 200, response.status
		humans = json(response.body)
		assert_equal "Hey c'est #{humans[0][:name]}!", humans[0][:message]
	end
end