require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.rotate!
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct? == true
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      category == turn.card.category && turn.correct? == true
    end
  end

  def percent_correct
    (number_correct / @turns.length.to_f) * 100
  end

  def total_number_by_category(category)
    @turns.count do |turn|
      category == turn.card.category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) /
    total_number_by_category(category).to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "---------------------------------------------------------"
    puts "This is card number #{@turns.length + 1} out of #{@deck.cards.length}."
    puts "Question: #{@deck.cards.first.question}"
    input = gets.chomp
    #pull this out to create a verify answer method
    if input.downcase.delete(".", )
  end
end
