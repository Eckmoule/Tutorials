module Api
	class Api::UsersController < ApplicationController

		before_action :authenticate

		def index 
			render json: User.all, status: 200
		end

		protected 
		def authenticate 
			authenticate_basic_auth || render_unauthorized
		end

		def authenticate_basic_auth
			authenticate_with_http_basic do |username, password|
				User.authenticate(username, password)
			end
		end

		def render_unauthorized 
			self.headers['WWW-Authenticate'] = 'Basic realm=Users'

			render json: 'Bad credentials', status: 401 
		end

	end
end