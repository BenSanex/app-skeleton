get '/questions' do
  puts current_user
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
  @answer.question = @question
  @answer.answerer = current_user
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :"questions/show"
  end
end

post '/questions/:id/answers/:answer_id/comments' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new(params[:comment])
  @comment.commentable = @answer
  # above line do these:
  # @comment.commentable_id = @question.id
  # @comment.commentable_type = @question.class.name
  @comment.commenter = current_user
  if request.xhr?
    if @comment.save
      200
    else
      @errors = @comment.errors.full_messages
      return false
    end
  else
    if @comment.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @comment.errors.full_messages
      erb :"questions/show"
    end
  end
end


