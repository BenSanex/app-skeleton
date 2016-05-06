before '/decks/*' do
  authenticate!
end

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end

get '/decks/:deck_id/round' do
  if session[:round_id] == nil
    @round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
    session[:round_id] = @round.id

    @cards = Card.where(deck_id: params[:deck_id])

    @cards.each do |card|
      Guess.create(card_id: card.id, first_try: true, round_id: @round.id, correct: false)
    endgt
  end

  @remaining_cards = Guess.where(correct: !true)

  if @remaining_cards.length == 0
    redirect "/users/#{session[:user_id]}"
  else
    next_card = @remaining_cards.sample
    redirect "/decks/#{params[:deck_id]}/cards/#{next_card.card_id}"
  end
end

get '/decks/:deck_id/cards/:id' do
  @card = Card.find(params[:id])
  erb :'cards/show'
end

post '/decks/:deck_id/round' do
  @card = Card.find(params[:card_id])
  status = @card.verify_guess(params[:player_guess])
  @guess = Guess.find_by(card_id: params[:card_id])
  @guess.update_attributes(correct: status)
  @guess.save
  if status == false
    @guess.update_attributes(first_try: false)
    @guess.save
  end
  redirect "/decks/#{params[:deck_id]}/round"
end
