post '/answers' do
  @answer = Answer.new(params[:answer])
  @answer.question_id = current_question
  @answer.answerer_id = current_user.id
  if @answer.save
    redirect "/questions/#{current_question}"
  else
    @errors = @answer.errors.full_messages
    erb :"questions/show"
  end
end
