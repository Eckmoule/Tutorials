#App creation

rails new soup_to_bit
cd soup_to_bit

#Launch server
rails server 

#Model creation
rails generate model Soup name:string featured:boolean category_id:integer
rails generate model Category name:string

#Database creation
rake db:migrate

#Rails console use
rails console 

#Creation
> Soup.new
> s = _ #_ contains the last returned value
> s.name = "Tonkotsu"
> s.featured = true
> s.save
> Soup.create(name: "Tomato Bisque", featured: false)

#Get
> Soup.last
> Soup.all
> Soup.where(name: "Tonkotsu")
> Soup.where(name: "Tonkotsu").first()
> Soup.find(1)
> Soup.find_by_name("Tomato Bisque")

#Update
> s = Soup.last
> s.featured = false
> s.save
> s.update(name: "Tonkotsu Ramen", featured: true)

#Delete
> Soup.last.destroy
> Soup.count

#I add the relation between Category and Soup (bleongs_to + has_many inside the ruby class)
# After modifying something you need to reload the console 

> reload!

> Category.create(name: "Ramen")
> Category.create(name: "Bouillon")

#Foreign keys
> s = Soup.first
> s.category_id = 1 
> s.save
> s = Soup.last
> s.category = Category.last
> s.save
> c = Category.last
> c.soups << Soup.last

#Add some validation rules inside the Model
#validates :name, presence: true, uniqueness: true

> s = Soup.create
> s.errors 

#Controller generation (outside of the rails console)

rails generate controller Soups
rails generate controller Categories
