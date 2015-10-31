get "/surveys" do
  @surveys = Survey.all
  erb :"/surveys/index"
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys' do
  user = current_user
  survey = Survey.new(author_id: user.id, title: params[:survey][:title], description: params[:survey][:description])
  if survey.save
    redirect "/surveys/#{survey.id}/questions/new"
  else
    @errors = survey.errors.full_messages
    erb :'surveys/new'
  end
end

get "/surveys/:id" do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end

get "surveys/:id/complete" do
  erb :"surveys/complete"
end
