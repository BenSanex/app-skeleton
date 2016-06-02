get '/users' do
  erb :'users/index'
end

get '/users/signup' do
  erb :'users/signup'
end

post '/users/signup' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/questions'
  else
    @errors = @user.errors.full_messages
    erb :'users/signup'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user != nil && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = ["Incorrect e-mail and/or password"]
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/questions'
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  erb :'users/profile'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

post '/users/:id/profile' do
  @user = User.find(params[:id])
  if current_user != nil && current_user.id == @user.id
    @user.update_attributes(params[:@user])
    redirect "/users/#{@user.id}/profile"
  else
    @errors = ["You are not authorized to do that!"]
    erb :'users/edit'
  end
end

get 'users/:id/activity' do
  erb :'users/activity'
end
