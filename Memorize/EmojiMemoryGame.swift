//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcus Erick Hinojosa Piña on 14/04/24.
//  ViewModel

import SwiftUI

//func createCardContent(forPairAtIndex index: Int) -> String {
//    return ["👻","🎃","🕷️","👿","💀","🕸️","🧙🏻‍♀️","🙀","👹","😱","☠️","🍭"][index]
//}

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻","🎃","🕷️","👿","💀","🕸️","🧙🏻‍♀️","🙀","👹","😱","☠️","🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
//    MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
