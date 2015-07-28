require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest

	setup { 
		host! 'api.apiexample-dev.com' #This is required for subdomain tests
		@user = User.create!(username: 'foo', password: 'secret') 
	}

	#This can be moved to the test helper
	def encode(username, password)
		ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
	end

	test 'valid username and password' do
		get '/users', {}, {'Authorization' => encode(@user.username, @user.password)}
		assert_equal 200, response.status
	end

	test 'missing credentials' do
		get '/users', {}, {}
		assert_equal 401, response.status
	end

end