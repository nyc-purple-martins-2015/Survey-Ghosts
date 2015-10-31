get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @errors = []
  @question = Question.new
  @choices = []
  erb :'questions/new'
end

get '/surveys/:survey_id/questions/:id' do

  @survey = Survey.find(params[:survey_id])
  @questions = Question.where(survey_id: params[:survey_id])
  @question = @survey.questions.find(params[:id])

  # @current_survey_questions = @surveys.questions.map { |question| question}
  # pull in the question options that are assoted with the survey id shown in the url only.
  erb :'/questions/show'
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  question = Question.new(survey: survey, query: params[:query])
  options = []
  errors = []
  if question.save
    params[:options].each do |_, option_text|
      if option_text.strip != ""
        option = Option.new(question: question, response: option_text.strip)
        if option.save
          options << option
        else
          errors += option.errors.full_messages
        end
      end
    end
  else
    errors += question.errors.full_messages
  end
  if options.count < 2
    errors << "You must add at least two options"
  end
  if !errors.empty?
    options.each { |option| option.destroy }
    question.destroy
    p errors
    redirect :"/surveys/#{survey.id}/questions/new?#{params.to_query}"
  else
    redirect :"/surveys/#{survey.id}/questions/new"
  end
end


post 'surveys/:id/questions' do

end
