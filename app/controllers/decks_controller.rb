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
  @cards = Card.where(deck_id: params[:deck_id])
  if session[:round_id] == nil
    p "New Round???"
    @round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
    session[:round_id] = @round.id
   end
    @remaining_cards = []
    @cards.each do |card|
    if card.guesses.count > 0
      if card.guesses.last.correct != true
      @remaining_cards << card
      end
    else
      @remaining_cards << card
    end
  end

  p @remaining_cards.count
  if @remaining_cards.length == 0
    round = Round.find(session[:round_id])

    round.update(number_of_cards: @cards.count, first_try_correct: Round.first_guess(session[:round_id]), total_guesses: Round.total_guesses(session[:round_id]))
    p round.save

    Guess.destroy_all
    session.delete(:round_id)
    redirect "/users/#{session[:user_id]}"
  else
    next_card = @remaining_cards.sample
    redirect "/decks/#{params[:deck_id]}/cards/#{next_card.id}"
  end
end

get '/decks/:deck_id/cards/:id' do
  @card = Card.find(params[:id])
  erb :'cards/index'
end

post '/decks/:deck_id/round' do
  @card = Card.find(params[:card_id])
  @status = @card.verify_guess(params[:player_guess])
  p @status
  if Guess.where(card_id: @card.id, round_id: session[:round_id]).count > 0
    p 'found guess'
    @guess = Guess.create(card_id: @card.id, first_try: false, round_id: session[:round_id], correct: @status )
  else
    p "didn't find previous guess"
   @guess = Guess.create(card_id: @card.id, first_try: true, round_id: session[:round_id], correct: @status )
  end
  erb :'cards/show'
  # redirect "/decks/#{params[:deck_id]}/round"
end
