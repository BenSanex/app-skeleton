get '/users/signup' do
  erb :'users/signup'
end

post '/users' do
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
    @errors = "Incorrect e-mail and/or password"
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/questions'
end

get '/users/:id' do
  erb :'users/profile'
end
