get '/login' do
  erb :'users/login'
end

post '/login' do
  username = params[:username]
  @user = User.where(username: username).first
  if @user && @user.authenticate(params[:username][:password])
    session[:user_id] = @user.id
    redirect to('/')
  else
    "Incorrect username or password"
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end
