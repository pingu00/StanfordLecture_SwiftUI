//
//  ContentView.swift
//  Memorize
//
//  Created by Phil on 2022/06/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game:EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack {
                Text(game.themeName).font(.largeTitle).foregroundColor(game.themeColor)
                Spacer()
                Text("Score: \(game.score)").font(.largeTitle).foregroundColor(.red)
            }
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(game.cards){ card in
                        CardView(card:card,viewModel: game)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }.foregroundColor(.red)
            .padding(.horizontal)
            Button{game.newGame()} label: {Text("NewGame")
                    .font(.largeTitle)
                .foregroundColor(Color.red)}
            
                
        }
    }
}

                         
struct CardView : View {
    let card:EmojiMemoryGame.Card
    @ObservedObject var viewModel:EmojiMemoryGame
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                        .font(.title)
            }
            else if card.isMatched{
                shape.opacity(0)
            }
            else {
                shape.fill().foregroundColor(viewModel.themeColor)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 12 Pro")
            .preferredColorScheme(.dark)

    }
}
