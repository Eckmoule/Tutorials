module Api
	class Api::EpisodesController < ApplicationController

		def create
			episode = Episode.new(episode_params)
			if episode.save
				# Status can be :created
				# Location will resolve the url automaticcaly
				render json: episode, status: 201, location: api_episode_url(episode)

				#To make ajax request faster it's possible to return an empty body. (with 204: No content)
				#render nothing: true, status: 204, location: api_episode_url(episode)

				#We can also use the head method (only http header)
				#head 204, location: api_episode_url(episode)
				#head :no_content, location: api_episode_url(episode)
			else
				render json: episode.errors, status: 422 #(:unprocessable_entity)
				#unhandled errors used 500 code (internal server error)
			end
		end

		def update 
			episode = Episode.find(params[:id])
			if episode.update(episode_params)
				render json: episode, status: 200
			else
				render json: episode.errors, status: 422
			end
		end

		def destroy 
			episode = Episode.find(params[:id])
			episode.destroy
			head 204

			#Also possible to flag instead of destroying
			#episode.find_unarchived(params[:id]) #model
			#episode.archive #model
			#head 204	
		end

		def index 
			render json: Episode.all, status: 200
		end

		private
		def episode_params
			params.require(:episode).permit(:title, :description)
		end
	end
end