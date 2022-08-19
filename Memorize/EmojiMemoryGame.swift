//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Phil on 2022/06/30.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject { // no inheritance, because it's superclass
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚛","🚆","🚑","🚒","🚐","🛻","🚚","🚜","🚔","🚖"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){ pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()
                 
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // MARK: - Intent(s)
    func choose (_ card : MemoryGame<String>.Card) {
        model.choose(card)
    }
}
