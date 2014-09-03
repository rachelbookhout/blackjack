require 'pry'

class Deck
  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []

    suits = ["♠","♥","♦" "♣"]
    ranks = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]

    suits.each do |suit|
      ranks.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end

    cards.shuffle!
  end

  def draw
    @deck.pop
  end
end


class Card
  attr_reader :rank
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
 #want to take this from the draw function in the deck
  def initialize
    card1 = Card.new
    card2 = Card.new
  end

  def intial_score
  initial_hand = []
  initial_hand << card1.value_of_card
  initial_hand << card2.value_of_card
  first_hand_score= initial_hand.inject(0){|result,element| result + element}
  first_hand_score
  end

  def new_score
    new_hand = initial_hand
    current_score = new_hand.inject(0){|result,element| result + element}
  end
end
################################################################################
playing_deck = Deck.new
binding.pry
player_hand = Hand.new
binding.pry
dealer_hand = Hand.new

puts "Player was dealt #{card1}"
puts "Player was dealt #{card2}"
puts "Player score #{player_hand.initial_score}"


# Unless player_hand.score >= 21
#   puts "Hit or Stand (H/S)"
#   answer = gets.chomp.uppercase
#   while answer != "S"
#     card3 = Card.new
#     new_hand << card3.value_of_card
#     puts "Player score #{player_hand.new_score}"
#     puts "Hit or Stand (H/S)"
#     answer = gets.chomp
#   end
# end
# while loop, get chomp, prompting for more input

















