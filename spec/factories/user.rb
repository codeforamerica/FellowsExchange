FactoryGirl.define do
  factory :user do
    skill_list Faker::Company.catch_phrase + ',' + Faker::Company.catch_phrase + ',' + Faker::Company.catch_phrase
  end
end
