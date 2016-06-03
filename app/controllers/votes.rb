# fa fa-star fa-3x
# fa fa-caret-up fa-3x
# fa fa-caret-down fa-3x

post '/questions/:question_id/vote' do
  question = Question.find(params[:question_id])
  vote = Vote.find_or_create_by(voter: current_user, votable: question)
  if vote.value == params[:vote].to_i
    vote.update(value: 0)
  else
    vote.update(value: params[:vote].to_i)
  end
  if request.xhr?
    content_type :json
    if logged_in?
      login = true
    else
      login = false
    end
    { points: question.points, logged_in: login }.to_json
  else
    redirect "/questions/#{question.id}"
  end
end

# delete '/questions/:id' do
#   # write logic for deleting questions here.
# end

# post '/questions' do
#   Question.create( title: params[:title],
#                username: Faker::Internet.user_name,
#                comment_count: rand(1000) )
#   redirect '/questions'
# end