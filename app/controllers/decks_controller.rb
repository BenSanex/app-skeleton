get '/decks' do
  @decks = Deck.all
  erb :'decks/decks_show'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'decks/deck_show_details'
end

get '/decks/:id/round' do
  @deck = Card.where(guess.correct != true)
  erb :round_show
end

post '/decks/:id/round' do
  @card = Card.find(params[:card_id])
  status = @card.verify_guess(params[:player_guess])
  Guess.create(card_id: params[:card_id], correct: status)
end

get 'decks/:deck_id/cards/:id' do
  @card. = Card.find(params[:id])
  erb :card_show
end

