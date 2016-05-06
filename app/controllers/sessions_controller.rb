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
