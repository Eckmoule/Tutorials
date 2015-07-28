class User < ActiveRecord::Base

	def self.authenticate(username, password)
		user = find_by(username: username)
		user && user.password == password
	end

end
