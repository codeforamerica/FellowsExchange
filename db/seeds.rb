if Rails.env != 'production'

require 'faker'
require 'factory_girl_rails'

puts "adding 20 users"
  20.times {
    user = Factory(:user, :name => Faker::Name.first_name + ' ' + Faker::Name.last_name)
    }

end
