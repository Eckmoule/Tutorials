class Book < ActiveRecord::Base
	
	belongs_to :genre
	has_many :book_readers
	has_many :readers, through: :book_readers

	# scope :finished, ->{ where('finished_on IS NOT NULL')}
	scope :finished, ->{ where.not(finished_on: nil)}
	#scope :recent, ->{ where('finished_on > ?', 2.day.ago)}
	scope :search, ->(keyword){ where(title: keyword) if keyword.present? }
	#scope :search, ->(keyword){ where('keywords like ?', "%#{keyword.downcase}%") if keyword.present? }
	scope :genre, ->(genre){ joins(:genre).where('genres.name = ?', genre) if genre.present? }
	scope :reader, ->(reader){ joins(:readers).where('readers.name = ?', reader) if reader.present? }
	
	before_save :set_keywords

=begin
	def self.search(keyword)
		if keyword.present?
			where(title: keyword)
		else
			all
		end
	end
=end

	protected
		def set_keywords
			self.keywords = [title, author, description].map { |p| p.downcase }.join(' ')
		end

	def self.recent
		where('finished_on > ?', 2.day.ago)
	end

	def finished?
		finished_on.present?
	end
end
