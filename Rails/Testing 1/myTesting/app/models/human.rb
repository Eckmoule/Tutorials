class Human < ActiveRecord::Base
	has_one :house

	validates :name, presence: true, uniqueness: true
	validates :gender, presence: true

end
