get '/questions/tagged/:tag_name' do
  @tag = Tag.find_by(name: params[:tag_name])
  erb :"tags/show"
end

get '/tags' do
  @tags = Tag.all
  erb :"tags/index"
end