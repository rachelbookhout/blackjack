require 'pry'

class Deck
  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []

    suits = ["♠", "♥", "♦", "♣"]
    ranks = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]


    suits.each do |suit|
      ranks.each do |rank|
        cards << Card.new(rank, suit)
      end
    end

    cards.shuffle!
  end

  def deal(hand)
    # binding.pry
    hand.cards << cards.pop
  end
end


class Card
  attr_reader :rank,:suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value_of_card(card)
    if (2..10).include?(card.rank)
      value = card.rank
    elsif ["J", "Q", "K"].include?(card.rank)
      value = 10
    else
      value = 11
    end

    value
  end

end

class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end


  def score(hand)
    hand_score = 0
    hand.each do |card|
      #binding.pry
      hand_score += card.value_of_card(card)
    end
  hand_score
  end


end
################################################################################
  def find_ace(hand)
    ace_count = 0
    hand.each do |cards|
      if cards.rank == "A"
        ace_count +=1
      end
    end
    ace_count
  end


playing_deck = Deck.new
#binding.pry
player_hand = Hand.new
#binding.pry
dealer_hand = Hand.new

# setup initial hands
2.times do
  playing_deck.deal(player_hand)
  # binding.pry
  playing_deck.deal(dealer_hand)
end

player_hand.cards.each do |card|
  puts "Player was dealt #{card.rank}#{card.suit}"
end

puts "Player score #{player_hand.score(player_hand.cards)}"

puts "Hit or Stand (H/S)"
answer = gets.chomp.upcase
   # if answer != "HIT" || answer != "STAY" || answer != "S" || answer != "H"
   #  puts "We don't understand your response. Please use stay or hit (H/S)"
   #  answer.gets.upcase
   # end
 # need a prompt to suggest they need to put in a valid input
  #while player_hand.score(player_hand.cards) <= 21
  while answer != "S"

      playing_deck.deal(player_hand)
      current_score = player_hand.score(player_hand.cards)
      puts "New Card: #{player_hand.cards[-1].rank}#{player_hand.cards[-1].suit}"

      if current_score <= 21
        puts "Player score #{current_score}"
        #binding.pry
        puts "Hit or Stand (H/S)"
        answer = gets.chomp.upcase
      else
        ace_count = find_ace(player_hand.cards)
          if ace_count >= 1
            current_score = current_score - (10 * ace_count)
            binding.pry
            puts "Player score #{current_score}"
            puts "Hit or Stand (H/S)"
            answer = gets.chomp
          else
            puts "Bust! Game over..."
            break
          end
      end


  puts "Player score #{player_hand.score(player_hand.cards)}"
  end



dealer_hand.cards.each do |card|
  puts "Dealer was dealt #{card.rank}#{card.suit}"
end

puts "Dealer score #{dealer_hand.score(dealer_hand.cards)}"




while dealer_hand.score(dealer_hand.cards) < 17
      playing_deck.deal(dealer_hand)
      puts "Dealer Hits..."
      puts "New Card: #{dealer_hand.cards[-1].rank}#{dealer_hand.cards[-1].suit}"
end


  if dealer_hand.score(dealer_hand.cards) <= 21
    puts "Dealer stands with a score of #{dealer_hand.score(dealer_hand.cards)}"
  else
   puts "You win! Dealer busts!"
  end


  if player_hand.score(player_hand.cards) <= 21 && dealer_hand.score(dealer_hand.cards) <= 21
       if player_hand.score(player_hand.cards) > dealer_hand.score(dealer_hand.cards)
           puts "You win because you are a winner!"
       else
         puts "Dealer wins"
       end

  end

















