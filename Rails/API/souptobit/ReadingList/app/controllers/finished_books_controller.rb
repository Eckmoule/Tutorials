class FinishedBooksController < ApplicationController
	def index
		books = Book.finished #Scope created in the book model
		respond_to do |format|
			format.json { render json: books, status: 200 } 
			format.xml { render xml: books, status: 200 } 
		end
	end
end