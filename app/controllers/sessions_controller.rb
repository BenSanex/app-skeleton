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
        erb :'sessions/login'
      end
    else
      erb :'sessions/login'
    end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end
