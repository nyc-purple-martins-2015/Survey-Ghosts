get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @errors = []
  @question = Question.new
  @options = []
  erb :"questions/_new_question_form", layout: false
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  # question = Question.new(survey: survey, query: params[:query])
  @question = survey.questions.new(params[:question])
  options = []
  errors = []
  if @question.save
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
    errors += @question.errors.full_messages
  end
  if options.count < 2
    errors << "You must add at least two options"
  end
  if !errors.empty?
    options.each { |option| option.destroy }
    @question.destroy
    p errors
    redirect :"/surveys/#{survey.id}/questions/new?#{params.to_query}"
  else
    erb :"/questions/_new_question_form", layout: false, locals: { survey: survey, question: question, options: options, errors: errors }
  end
end