get '/login' do
  erb :login
end

post '/sign_up' do
  new_user = User.new(username: params[:email])
  new_user.password = params[:password]

  if new_user.save
    session[:username] = new_user.username
    redirect('/')
  else
    @error_message = "A user already exists with that name!"
    erb :login
  end
end

post '/login' do
  user_login = User.find_by_username(params[:email])
  if user_login.nil?
    @invalid_username = "Appears as if we have no user with that name, sorry Charlie!"
    erb :login
  elsif user_login.authenticate(params[:password])
    session[:username] = user_login.username
    redirect('/')
  else
    @invalid_password = "Whoops looks like that password is baloney."
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect('/')
end

get '/user/:user_id' do
  @user_profile = User.find(params[:user_id])
  erb :userprofile
end
