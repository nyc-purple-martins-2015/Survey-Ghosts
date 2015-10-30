get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    status 400
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do |id|
  @user = User.find(id)
  erb :'/users/show'
end
