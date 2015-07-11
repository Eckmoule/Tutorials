FactoryGirl.define do
  factory :human do
    sequence(:name) { |i| "H#{i}" }
	gender "Male"

	factory :human_theo do
		name 'Theo'
	end

	factory :human_julie do
		name 'Julie'
		gender 'Female'
	end

	factory :human_mass do
		sequence(:name) { |i| "Human#{i}" }
	  	gender "Male"
	end

	factory :human_special_house do
		name "Special Man"
		association :house, factory: :house_special
	end
  end

  #You need to specify the class because there is no human_with_house class
  factory :human_with_house, class: Human do
  	sequence(:name) { |i| "HumanWithHouse#{i}"}
  	association :house
  	gender 'Male'
  end

end
