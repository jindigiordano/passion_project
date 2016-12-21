#new
# get '/sessions/new' do
get '/login' do
  erb :'/sessions/_new'
end

post '/sessions' do
  @params = params
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    login(@user)
    redirect '/'
  else
    erb :'/sessions/new'
  end
end

# delete '/sessions' do
delete '/logout' do
  logout
  redirect '/'
end
