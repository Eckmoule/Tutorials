require 'test_helper'

class CreatingEpisodesTest < ActionDispatch::IntegrationTest

	setup { 
		host! 'api.apiexample-dev.com' #This is required for subdomain tests
		@episode = Episode.create!(title: 'First one')
	} 

	test 'creates epidodes' do 
		post '/episodes', 
			{ episode: 
				{ title: 'Bananas', description: 'Learn about bananas' }
			}.to_json,
			{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

			assert_equal 201, response.status
			assert_equal Mime::JSON, response.content_type

			episode = json(response.body)
			assert_equal api_episode_url(episode[:id]), response.location
	end

	test 'does not create episodes with title nil' do
		post '/episodes',
			{ episode:
				{ title: nil, description: 'Learn about bananas' }
			}.to_json,
			{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

			assert_equal 422, response.status 
			assert_equal Mime::JSON, response.content_type
	end

	test 'successful update' do
		patch "/episodes/#{@episode.id}", 
			{ episode: { title: 'First edit' } }.to_json,
			{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 200, response.status
		assert_equal 'First edit', @episode.reload.title
	end

	test 'unsuccessful update on short title' do
		patch "/episodes/#{@episode.id}", 
			{ episode: { title: 't' } }.to_json,
			{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 422, response.status
	end

	test 'successful deletion' do
		delete "/episodes/#{@episode.id}"
		assert_equal 204, response.status
	end

end