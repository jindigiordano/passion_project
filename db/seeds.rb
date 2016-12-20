require 'faker'

#Delete all
User.delete_all
Thing.delete_all

#Create sample users

10.times do
  user = User.new(username: Faker::Internet.user_name, password: "password", email: Faker::Internet.email)
  user.save!
end
