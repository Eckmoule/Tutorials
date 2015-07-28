class Episode < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 2 }

	def self.find_unarchived(id)
		find_by!(id: id, archived: false)
	end

	def archive 
		self.archived = true
		self.save
	end

end
