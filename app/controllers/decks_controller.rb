get '/decks' do
  @decks = Deck.all
  erb :'decks/decks_show'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'decks/deck_show_details'
end

get '/decks/:id/round' do
  @deck = Card.where(deck_id: params[:id])
  erb :round_show
end

