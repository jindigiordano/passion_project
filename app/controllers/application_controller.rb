get '/' do
  if current_user
    @user = current_user
    @characters = @user.characters
  end
  erb :index
end
