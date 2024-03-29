//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Phil on 2022/06/30.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject { // no inheritance, because it's superclass
    
    typealias Card = MemoryGame<String>.Card
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.contents.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    private var theme:Theme
    
    static var themes:Array<Theme> = [
        Theme(name: "Expression",
              contents: ["😀","😃","😄","😁","😆","😅","😂","🤣","☺️","😊","😇","🙂","🙃","😉","😌"],
              numberOfPairsOfCard: 8,
              color: "red"),
        Theme(name: "Animals",
              contents: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯"],
              numberOfPairsOfCard: 8,
              color: "orange"),
        Theme(name: "Fruits",
              contents: [ "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"],
              numberOfPairsOfCard: 7,
              color: "yellow"),
        Theme(name: "Objects",
              contents: [ "📁", "📂", "⌚", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🖱"],
              numberOfPairsOfCard: 10,
              color: "green"),
        Theme(name: "Flags",
              contents: [ "🏳️", "🏴", "🏁", "🚩", "🏳️‍🌈", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸"],
              numberOfPairsOfCard: 8,
              color: "blue"),
        Theme(name: "Flags",
              contents: [ "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱"],
              numberOfPairsOfCard: 10,
              color: "purple")
    ]
        
    
    static func createMemoryGame(theme:Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCard){ pairIndex in
            theme.contents[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String>
    
    
    var themeName:String {
        return theme.name
    }
    var score: Int {
        return model.score
    }
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "green":
            return .green
        case "blue":
            return .blue
        case "purple":
            return .purple
        default:
            return .black
        }
        
    }
    var cards: Array<Card> {
        return model.cards
    }
    // MARK: - Intent(s)
    func choose (_ card : Card) {
        model.choose(card)
    }
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.contents.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
