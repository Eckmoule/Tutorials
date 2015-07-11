FactoryGirl.define do
  factory :house do
    name "House"
	association :human

	factory :house_special do
		name "Special"
	end
  end

end
