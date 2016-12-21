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
genders = ['male', 'female', 'non-binary', 'none']
classes = ['Aerobat', 'Antarian Ranger', 'Big Game Hunter', 'Bodyguard',
            'Bounty Hunter', 'Changeling', 'Chief Engineer', 'Crime Lord',
            'Deep Space Pilot', 'Elite Trooper', 'Holovid Star', 'Infiltrator',
            'Loyal Protector', 'Martial Arts Master', 'Master Duelist', 'Master Gunner',
            'Master Spy', 'Naval Officer', 'Officer', 'Outlaw Slicer', 'Priest', 'Sharpshooter',
            'Sienar Engineer', 'Starship Ace', 'Treasure Hunter', 'Assassin',
            'Jedi Ace', 'Jedi Artisan', 'Jedi Healer', 'Jedi Instructor', 'Jedi Investigator', 'Jedi Master',
            'Jedi Scholar', 'Jedi Watchman', 'Jedi Weapon Master', 'Beastwarden', 'Force Witch', 'Force Warrior',
            'Berserker Droid', 'Black Sun Enforcer', 'Black Sun Vigo', 'Corporate Troubleshooter', 'Corporate Viceprex',
            'CorSec Officer', 'Crime Broker', 'Espionage Droid', 'Lord of the Expanse', 'Senate Guard', 'Shadow Wing Captain',
            'Dark Side Assassin', 'Dark Side Devotee', 'Dark Side Marauder', 'Sith Acolyte', 'Sith Lord', 'Sith Warrior']

@users = User.all

10.times do
  char_species = Swapi.get_species rand(1..37)
  char_planet = Swapi.get_planet rand(1..61)
  char_vehicle = Swapi.get_vehicle rand(1..39)
  char_starship = Swapi.get_starship rand(9..13)

  character = Character.new(name: Faker::StarWars.character, gender: genders.sample, species: char_species,
                            homeplanet: char_planet, class: classes.sample, vehicle: char_vehicle,
                            starship: char_starship, user_id: rand(1..@users.length), backstory: "")
end
