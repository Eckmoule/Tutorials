#Tests use like other env a specific database that can be configured in config/database.yml

#To specify the env to deploy 
> rake db:migrate rails_env=test

#Check for migration + load schema
> rake db:test:prepare

#Prepare + run all tests 
> rake test

#Individual test 
> ruby -Itest test/model/zombie_test.rb

#Single test case
> ruby -Itest test/model/zombie_test.rb -n test_the_truth

