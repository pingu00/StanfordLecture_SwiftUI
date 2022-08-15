//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Phil on 2022/06/30.
//

import SwiftUI



class EmojiMemoryGame { // no inheritance, because it's superclass
    static let emojis:[String] = ["🚗","🚕","🚙","🚌","🚎","🏎","🚛","🚆","🚑","🚒","🚐","🛻","🚚","🚜","🚔","🚖"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){ pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
                 
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // Mark: - Intent(s)
    func choose (_ card : MemoryGame<String>.Card) {
        model.choose(card)
    }
}
