get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @errors = []
  @question = Question.new
  @choices = []
  erb :'questions/new'
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

get '/surveys/:survey_id/questions/:id' do

  @survey = Survey.find(params[:survey_id])
  @questions = Question.where(survey_id: params[:survey_id])
  @question = @survey.questions.find(params[:id])

  erb :'/questions/show', layout: false
end

post '/chosen_options' do
    questions = Question.where(survey_id: params[:survey_id])
    current_question = Question.find_by(id: params[:question_id])
    selected_option = ChosenOption.new(user_id: current_user.id, option_id: params[:option_id], survey_id: params[:survey_id])
    if selected_option.save
      if  current_question == questions.last
        if request.xhr?
          erb :'surveys/complete'
        else
        redirect to("/surveys/#{params[:survey_id]}/complete"), layout: false
        end
      else
        next_question_index = questions.index(current_question) + 1
        redirect to("/surveys/#{params[:survey_id]}/questions/#{questions[next_question_index].id}"), layout:false
      end
    else
      status 400
      errors += option.errors.full_messages
    end
end
