# index
get '/characters' do
  @characters = Character.all

  erb :'characters/index'
end

# create
post '/characters' do
  #pick random page
  i = rand(1..4)
  url = 'http://swapi.co/api/species/?page=' + i.to_s
  uri = URI(url)
  response = Net::HTTP.get(uri)
  species_page = JSON.parse(response)
  species_arr = species_page["results"]
  #random species
  rand_idx = rand(0..(species_arr.length-1))
  random_species = species_arr[rand_idx]
  species_matchobj = /\bspecies\b\/\d+/.match(random_species.to_s)
  if species_matchobj.to_s.length == 9
    species_num = species_matchobj.to_s[-1].to_s
  elsif species_matchobj.to_s.length == 10
    species_num = species_matchobj.to_s[-2..-1].to_s
  end
  species_obj = JSON.parse(Swapi.get_species species_num)


  #pick random page
  i = rand(1..7)
  url = 'http://swapi.co/api/planets/?page=' + i.to_s
  uri = URI(url)
  response = Net::HTTP.get(uri)
  planet_page = JSON.parse(response)
  planet_arr = planet_page["results"]
  
  #random planet
  rand_idx = rand(0..(planet_arr.length-1))
  random_planet = planet_arr[rand_idx]
  planet_matchobj = /\bplanets\b\/\d+/.match(random_planet.to_s)
  if planet_matchobj.to_s.length == 9
    planet_num = planet_matchobj.to_s[-1].to_s
  elsif planet_matchobj.to_s.length == 10
    planet_num = planet_matchobj.to_s[-2..-1].to_s
  end
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
