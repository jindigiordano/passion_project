# index
get '/characters' do
  @characters = Character.all

  erb :'characters/index'
end

# create
post '/characters' do
  @character = Character.new(params)
  @character.user = current_user

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

  erb :'characters/show'
end

# destroy
delete '/characters/:id' do
  @character = Character.find(params[:id])
  @character.destroy
  redirect '/characters'
end
