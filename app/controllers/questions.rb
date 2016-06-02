get '/questions' do

  @questions = Question.all
  erb :'questions/index'
end


get '/questions/new' do
  erb :'questions/new'
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.author_id = current_user.id
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :"questions/new"
  end
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question_id = @question.id
  @answer.answerer_id = current_user.id
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :"questions/show"
  end
end