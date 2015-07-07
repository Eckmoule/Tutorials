class Reader < ActiveRecord::Base
	has_many :book_readers
	has_many :books, through: :book_readers
end
