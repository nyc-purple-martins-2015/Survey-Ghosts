get "/surveys" do
  @surveys = Survey.all
  # @author =
  erb :"/surveys/index"
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys' do
  user = current_user
  survey = Survey.new(params[:survey])
  if survey.save
    redirect "/"
  else
    @errors = survey.errors.full_messages
    erb :'surveys/new'
  end
end