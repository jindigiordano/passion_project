get '/' do
  # all_ships = JSON.parse(Swapi.get_all 'starships')
  # max = all_ships["results"].length
  # p all_ships["results"][rand(0..max)]
  erb :index
end
