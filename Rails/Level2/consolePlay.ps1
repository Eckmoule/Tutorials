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
