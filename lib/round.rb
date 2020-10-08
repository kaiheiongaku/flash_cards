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

  def pre_question_info
    puts "This is card number #{@turns.length + 1} out of #{@deck.cards.length}."
    puts "Question: #{@deck.cards.first.question}"
  end

  def question
    while @turns.length + 1 <= @deck.cards.length
      pre_question_info
      input = gets.chomp
      take_turn(input)
      puts @turns.last.feedback
    end
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "---------------------------------------------------------"
    question
    end_of_round
  end

  def list_of_categories
    @deck.cards.map do |card|
      card.category
    end.uniq
  end

  def list_percent_by_category
    self.list_of_categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
  end

  def end_of_round
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@deck.cards.length}
          for a total score of #{percent_correct}."
    list_percent_by_category
  end
end
