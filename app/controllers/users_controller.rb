#YOU MAY ONLY VIEW YOUR OWN PROFILE!! AUTHENTICATE
before '/users*' do
  authenticate!
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end
