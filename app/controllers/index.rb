enable :sessions

get '/' do
  redirect '/questions'
  erb :index
end
