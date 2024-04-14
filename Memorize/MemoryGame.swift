//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Marcus Erick Hinojosa Piña on 14/04/24.
//  MODEL

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
//        cards = Array<Card>()
//        cards = [Card]()
        cards = []
//        add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            
            cards.append(Card(content: cardContentFactory(pairIndex) ))
            cards.append(Card(content: cardContentFactory(pairIndex) ))
        }
    }
    
    func choose(_ card: Card) {
            
    }
    
    mutating func shuffle () {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
