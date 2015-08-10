require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  
	setup do
		Book.create!(title: 'Book1', rating: 5)
		Book.create!(title: 'Book2', rating: 3)
	end

	test 'listing books' do
		get '/books'

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	
		assert_equal Book.count, json(response.body).size #json is define in helpers
	end

	test 'lists rop rated books' do
		get '/books?rating=5'

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type

		assert_equal 1, json(response.body).size #json is define in helpers
	end

end
