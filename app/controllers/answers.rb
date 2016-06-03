post '/answers' do
  @answer = Answer.new(params[:answer])
  current_question = @answer.question_id
  @answer.answerer = current_user
  if @answer.save
    redirect "/questions/#{current_question}"
  else
    @errors = @answer.errors.full_messages
    erb :"questions/show"
  end
end

post '/answers/:answer_id/vote' do
  answer = Answer.find(params[:answer_id])
  question = Question.find(answer.question.id)

  vote = Vote.find_or_create_by(voter: current_user, votable: answer)

  if vote.value == params[:vote].to_i
    vote.update(value: 0)
  else
    vote.update(value: params[:vote].to_i)
  end
  if request.xhr?
    content_type :json
    { points: answer.points }.to_json
  else
    redirect "/questions/#{question.id}"
  end
end