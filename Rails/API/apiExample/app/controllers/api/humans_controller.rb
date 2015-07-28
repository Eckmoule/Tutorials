module Api
	class Api::HumansController < ApplicationController

		def index
			@humans = Human.all
			#A set locale function has been define first in application controller
			#If you don't specify any block a template need to be define app/views/humans/index.json.jbuilder
			#This will use the translation file config/locales/en.yml
			respond_to do |format|
				format.json #{ render json: @humans, status: 200 }
			end
		end

	end
end