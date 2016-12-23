# index
get '/characters' do
  @characters = Character.all

  erb :'characters/index'
end

# create
post '/characters' do
  all_species = JSON.parse(Swapi.get_all 'species')
  random_species = all_species["results"][rand(0..all_species.length)]
  species_matchobj = /\bspecies\b\/\d/.match(random_species.to_s)
  species_num = species_matchobj.to_s[-1].to_s
  species_obj = JSON.parse(Swapi.get_species species_num)
  p species_matchobj
  p species_num
  p species_obj
  p species_obj["name"]

  all_planets = JSON.parse(Swapi.get_all 'planets')
  random_planet = all_planets["results"][rand(0..all_species.length)]
  planet_matchobj = /\bplanets\b\/\d/.match(random_planet.to_s)
  planet_num = planet_matchobj.to_s[-1].to_s
  planet_obj = JSON.parse(Swapi.get_planet planet_num)
  p planet_matchobj
  p planet_num
  p planet_obj
  p planet_obj["name"]

  # all_vehicles = JSON.parse(Swapi.get_all 'vehicles')
  # random_vehicle = all_vehicles["results"].sample
  # vehicle_matchobj = /\bvehicles\b\/\d/.match(random_vehicle.to_s)
  # vehicle_num = vehicle_matchobj.to_s[-1].to_s
  # vehicle_obj = JSON.parse(Swapi.get_vehicle vehicle_num)
  # p vehicle_matchobj
  # p vehicle_num
  # p vehicle_obj
  # p vehicle_obj["name"]

  # all_starships = JSON.parse(Swapi.get_all 'starships')
  # random_starship = all_starships["results"].sample
  # starship_matchobj = /\bstarships\b\/\d/.match(random_starship.to_s)
  # starship_num = starship_matchobj.to_s[-1].to_s
  # starship_obj = JSON.parse(Swapi.get_starship starship_num)
  # p starship_matchobj
  # p starship_num
  # p starship_obj
  # p starship_obj["name"]

  professions = ['Aerobat', 'Antarian Ranger', 'Big Game Hunter', 'Bodyguard',
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


  @character = Character.new({
    name: params[:name],
    gender: params[:gender],
    species: species_obj["name"],
    species_id: species_num,
    homeplanet: planet_obj["name"],
    homeplanet_id: planet_num,
    profession: professions.sample,
    user_id: current_user.id,
    backstory: ""
  })

  @character.save!


  if @character.save
    redirect "characters/#{@character.id}"
  else
    erb :'characters/_new'
  end
end

# new
get '/characters/new' do
  if current_user
    erb :'characters/_new'
  else
    #TODO show user a helpful error message
    redirect 'characters'
  end
end

# show
get '/characters/:id' do
  @character = Character.find(params[:id])
  @user = User.find(@character.user_id)


  erb :'characters/_show'
end

# destroy
delete '/characters/:id' do
  @character = Character.find(params[:id])
  @character.destroy
  redirect '/characters'
end
