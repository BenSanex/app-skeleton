get '/register' do
  erb :'sessions/register'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    erb :'sessions/register'
  end
end

get '/login' do
  erb :'sessions/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/decks'
    else
      redirect '/login'
    end
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end
