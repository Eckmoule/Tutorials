require 'test_helper'

class HumanTest < ActiveSupport::TestCase
	#FactoryGirl.create(:human) Save in database and return
	#FactoryGirl.build(:human) Instanciate and return

	test "Test different name" do
		yohan = FactoryGirl.create(:human)
		theo = FactoryGirl.create(:human_theo)
		assert_not_equal yohan.name, theo.name
		jean = FactoryGirl.create(:human, name: 'Jean')
		assert_not_equal yohan.name, jean.name
	end

	test "Test on multiple data" do
		human = FactoryGirl.build(:human_mass)
		human2 = FactoryGirl.build(:human_mass)
		assert_not_equal human.name, human2.name
		100.times { FactoryGirl.create(:human_mass) }
		assert_equal Human.all.count, 100
	end

	test "Test association" do
		human = FactoryGirl.create(:human_with_house)
		human2 = FactoryGirl.create(:human_special_house)
		assert_not_equal human.house.name, human2.house.name
	end

	test "Test association 2" do
		human = FactoryGirl.create(:human)
		house = FactoryGirl.create(:house, human: human)
		assert_equal human.name, house.human.name
	end

end
