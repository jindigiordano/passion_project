require 'faker'

#Delete all
User.delete_all
Character.delete_all

# Create sample users

10.times do
  user = User.new(username: Faker::Internet.user_name, password: "password", email: Faker::Internet.email)
  user.save!
end

# Create sample characters
# genders = ['male', 'female', 'non-binary', 'none']
#
#   @users = User.all
#   char_species = JSON.parse(Swapi.get_species 1)
#   char_species_name = char_species["name"]
#   char_planet = JSON.parse(Swapi.get_planet 2)
#   char_planet_name = char_planet["name"]
#   char_vehicle = JSON.parse(Swapi.get_vehicle 4)
#   char_vehicle_name = char_vehicle["name"]
#   char_starship = JSON.parse(Swapi.get_starship 5)
#   char_starship_name = char_starship["name"]
#
#
#   character = Character.new(name: Faker::StarWars.character, gender: genders.sample, species: char_species_name, homeplanet: char_planet_name, profession: professions.sample, vehicle: char_vehicle_name, starship: char_starship_name, user_id: rand(1..@users.length), backstory: "")
#   character.save!
