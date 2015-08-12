require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  
	setup do
		@fiction = Genre.create!(name: 'Fiction')
		
		@fiction.books.create!(title: 'Book1', rating: 5)
		@fiction.books.create!(title: 'Book2', rating: 3)
	end

	test 'listing books' do
		get '/api/books'

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	
		books = json(response.body)[:books]
		assert_equal Book.count, books.size #json is define in helpers
		assert_equal @fiction.id, books.first[:genre_id]
	end

	test 'lists rop rated books' do
		get '/api/books?rating=5'

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type

		assert_equal 1, json(response.body)[:books].size #json is define in helpers
	end

end
