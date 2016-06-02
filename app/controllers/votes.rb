# fa fa-star fa-3x
# fa fa-caret-up fa-3x
# fa fa-caret-down fa-3x

post '/questions/:id/vote' do
  question = Question.find(params[:id])
  vote = Vote.find_or_create_by(voter: current_user, votable: question)
  vote.update(value: params[:vote].to_i)
  if request.xhr?
    content_type :json
    { points: question.points }.to_json
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