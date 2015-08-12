class GenreSerializer < ActiveModel::Serializer
  attributes :id, :nama

  embed :ids #? in course rails pattern 
  has_many :books #This will bring the books
end
