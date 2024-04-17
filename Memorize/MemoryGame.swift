//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Marcus Erick Hinojosa Piña on 14/04/24.
//  MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
//        cards = Array<Card>()
//        cards = [Card]()
        cards = []
//        add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            
            cards.append(Card(content: cardContentFactory(pairIndex), id: "\(pairIndex+1)a" ))
            cards.append(Card(content: cardContentFactory(pairIndex), id: "\(pairIndex+1)b" ))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp == true {
//                    faceUpCardIndices.append(index)
//                }
//            }
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
//        }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
            
//        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id} ) {
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
//    func index(of card: Card) -> Int? {
//        for index in cards.indices {
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return nil
//    }
    
    mutating func shuffle () {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//                lhs.isMatched == rhs.isMatched &&
//                lhs.content == rhs.content
//        }
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content): \(isFaceUp ? "Up" : "Down")\(isMatched ? "Matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
