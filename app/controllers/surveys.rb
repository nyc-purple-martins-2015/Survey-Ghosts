get "/surveys" do
  @surveys = Survey.all
  erb :"/surveys/index"
end

get '/surveys/new' do
  if session[:user_id]
    @survey = Survey.new
    erb :"surveys/new"
  else
    @errors = ["Please log in to create survey."]
    erb :"surveys/index" ## does this work?
  end
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
  @surveys = Survey.all
  @survey = Survey.find(params[:id])
  @taken = false
  if ChosenOption.where(user_id: current_user.id, survey_id: @survey.id).first
    status 400
    @taken = true
    erb :"/surveys/index"
  else
  erb :"surveys/show"
  end
end

get "/surveys/:id/complete" do
  @survey = Survey.find(params[:id])
  erb :"surveys/complete"
end
