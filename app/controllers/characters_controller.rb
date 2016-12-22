# index
get '/characters' do
  @characters = Character.all

  erb :'characters/index'
end

# create
post '/characters' do
  all_species = JSON.parse(Swapi.get_all 'species')
  max_species = all_species.length
  all_planets = JSON.parse(Swapi.get_all 'planets')
  max_planets = all_planets.length
  all_vehicles = JSON.parse(Swapi.get_all 'vehicles')
  max_vehicles = all_vehicles.length
  all_starships = JSON.parse(Swapi.get_all 'starships')
  max_starships = all_starships.length

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
    species: all_species["results"][rand(0..max_species)],
    homeplanet: all_planets["results"][rand(0..max_planets)],
    profession: professions[rand(0..professions.length)],
    vehicle: all_vehicles["results"][rand(0..max_vehicles)],
    starship: all_starships["results"][rand(0..max_starships)],
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

  species_matchobj = /\bspecies\b\/\d/.match(@character.species)
  species_num = species_matchobj.to_s[-1].to_s
  @species_obj = JSON.parse(Swapi.get_species species_num)


  erb :'characters/_show'
end

# destroy
delete '/characters/:id' do
  @character = Character.find(params[:id])
  @character.destroy
  redirect '/characters'
end
