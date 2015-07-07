#Initialize application 

> rails new readingList
> rails s
> rails generate scaffold Book title author descrition:text amazon_id
> rake db:migrate

#Fill the db/seed.rb file (used to create data)

> rake db:seed 

#Fill the config/routes.rb file to define the root route 

#It's possible to run the console in sandbox box. Every modifications will be remove on exit (rails c --sandbox)

#Creation of a database migration 

> rails g migration add_rating_to_books rating:integer 
> rake db:migrate

#In rails the convention if _at for datetime and _on for date 

> rails g migration add_finished_on_to_books finished_on:date
> rake db:migrate 

#Add rating and date on the seed file

> rake db:seed

#Add a scope to Book class for finished books

> Book.finished 
> Book.finished.to_sql #this print out the sql
> reload! #reload the console

#Add genres 
#We don't need a full scaffold here 

> rails g model Genre name 
> rake db:migrate 

#Add the relationship between books and genre (has_many) in the models

> rails g migration add_genre_to_books genre:references
> rake db:migrate

#Add the relationship between books and genre (belongs_to) in the models

#Add readers

> rails g model Reader name
> rake db:migrate
> rails g model BookReader book:references reader:references

#Add the reference on the models (has many through)
#Add data to the seed file

#Add filters for genre and readers

#Create a book via the formula. The params need to be define in the controller. 
#Make the controller works with javascript (add format to controller) and create a app/views/books/create.js.erb


#It's possible to delete something scaffold, migration, ... 

> rails destroy migration add_genre_to_books

#A migration should be doable in both way

> rake db:migrate 
> rake db:migrate:redo

#It's possible to reload the seed from the rails console 

> Rails.application.load_seed