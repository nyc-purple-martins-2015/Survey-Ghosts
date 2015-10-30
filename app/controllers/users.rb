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
  @author_surveys = @user.surveys
  options_made = @user.chosen_options
  @taken_surveys = []
  options_made.each do |s|
    @taken_surveys << Survey.find(s.survey_id)
  end
  @taken_surveys.uniq
  erb :'users/show'
end