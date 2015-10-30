get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @errors = []
  @question = Question.new
  @choices = []
  erb :'questions/new'
end
