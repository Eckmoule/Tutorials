class Zombie < ActiveRecord::Base
	validates :name, :graveyard, presence: true
	has_many :tweets
	has_one :weapon

	def avatar_url 
		"http://zombitar.com/#{id}.jpg"
	end

	def decapitate
		weapon.slice(self, :head)
		self.graveyard = "dead again"
	end

	def geolocate
		loc = weapon.graveyard_locator(self.graveyard)
		"#{loc.latitude}, #{loc.longitude}"
	end
end


