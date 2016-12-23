# show
get '/planets/:id' do
  @species = JSON.parse(Swapi.get_species :id)
  p @species

  erb :'species/_show'
end
