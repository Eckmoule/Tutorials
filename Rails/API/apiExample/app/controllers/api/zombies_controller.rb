module Api
	class Api::ZombiesController < ApplicationController
		
		def index
			zombies = Zombie.all #Since rails 4 this returns a scope (no db request done at this point). We can add parameters with the where clause before requesting the database.
			if weapon = params[:weapon]
				zombies = zombies.where(weapon: weapon)
			end

			respond_to do |format|
				format.json { render json: zombies, status: 200 }
				format.xml { render xml: zombies, status: 200 }
			end
		end

		def show
			zombie = Zombie.find(params[:id])
			render json: zombie, status: :ok
		end

	end
end