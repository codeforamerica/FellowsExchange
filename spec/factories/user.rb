FactoryGirl.define do
  factory :user do
    uid "bSNqC4s_4k"
    skill_list Faker::Company.catch_phrase + ',' + Faker::Company.catch_phrase + ',' + Faker::Company.catch_phrase
    interest_list  Faker::Company.catch_phrase + ',' + Faker::Company.catch_phrase
  end
end
