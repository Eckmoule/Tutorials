# To install gem install activesupport
# Can also install i18n 

require 'active_support/all' #It's possible to require only what you need 

#Arrays 

array = [0, 1, 2, 3, 4, 5, 6];
puts array.from(3);
puts array.to(2);
array.in_groups_of(3) # => [0,1,2] [3,4,5] [6,nil,nil]
array.split(2) # => [0,1] [3,4,5,6] Notice the 2 has been remove du to his position

#Date

date = DateTime.new(2015, 5, 7, 14, 27, 45);
puts date
puts date.at_beginning_of_day
puts date.at_end_of_month
puts date.at_beginning_of_year
puts date.advance(years: 4, months: 3, weeks: 2, days: 1)
puts date.tomorrow
puts date.yesterday

#Hash 

options = { user: 'toto', lang: 'fr' }
new_options = { user: 'toto', password: 'pass' }

puts options.stringify_keys #turns into strings 
puts options.reverse_merge(new_options) #can be usefull to define default parameters for example 
puts new_options.except(:password)

#Inflector

puts "man".pluralize
puts "women".singularize
puts "ruby bit".titleize
puts "ruby bit".capitalize
puts "account_options".humanize