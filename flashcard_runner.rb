require './lib/round'

card1 = Card.new("What piece did Debussy write for clarinet and orchestra?",
                 "Premiere Rhapsodie",
                 :Music)
card2 = Card.new("Who wrote 'L'Histoire du Soldat'?",
                 "Igor Stravinsky",
                 :Music)
card3 = Card.new("What does Thoreau emphasize in 'Walden'?",
                 "simplicity",
                 :Philosophy)
card4 = Card.new("How does Aristotle argue one becomes virtuous?",
                 "doing virtuous actions",
                 :Philosophy)
card5 = Card.new("What is the Japanese word for the total harmony of a life?",
                 "ikigai",
                 :Japanese)
deck = Deck.new([card1, card2, card3, card4, card5])
round = Round.new(deck)
round.start
