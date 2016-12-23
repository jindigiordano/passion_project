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


  all_planets = JSON.parse(Swapi.get_all 'planets')
  random_planet = all_planets["results"][rand(0..all_species.length)]
  planet_matchobj = /\bplanets\b\/\d/.match(random_planet.to_s)
  planet_num = planet_matchobj.to_s[-1].to_s
  planet_obj = JSON.parse(Swapi.get_planet planet_num)


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
    erb :'characters/new'
  end
end

# new
get '/characters/new' do
  if current_user
    erb :'characters/new'
  else
    #TODO show user a helpful error message
    redirect 'characters'
  end
end

# show
get '/characters/:id' do
  @character = Character.find(params[:id])
  @user = User.find(@character.user_id)


  erb :'characters/show'
end

# destroy
delete '/characters/:id' do
  @character = Character.find(params[:id])
  @character.destroy
  redirect '/'
end
