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

  # def intial_score
  #   initial_hand = []
  #   initial_hand << card1.value_of_card
  #   initial_hand << card2.value_of_card
  #   first_hand_score= initial_hand.inject(0){|result,element| result + element}
  #   first_hand_score
  # end

  # def new_score
  #   new_hand = initial_hand
  #   current_score = new_hand.inject(0){|result,element| result + element}
  # end

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
 # need a prompt to suggest they need to put in a valid input
  while answer != "S"
    #binding.pry
      #binding.pry
      playing_deck.deal(player_hand)
      #binding.pry
      if player_hand.score(player_hand.cards) < 21
        puts "Player score #{player_hand.score(player_hand.cards)}"
        puts "Hit or Stand (H/S)"
        answer = gets.chomp
      elsif player_hand.score(player_hand.cards) == 21
        puts "21!"
      else
        puts "Bust! Game over..."
      break
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
          if dealer_hand.score(dealer_hand.cards) > 21
            puts "You win!"
            break
        end
    end

    if dealer_hand.score(dealer_hand.cards) < 21
      puts "Dealer stands with a score of #{dealer_hand.score(dealer_hand.cards)}"

    if player_hand.score(player_hand.cards) > dealer_hand.score(dealer_hand.cards)
          puts "You win!"
        else
        "Dealer wins"
        end















