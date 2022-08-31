//
//  ContentView.swift
//  Memorize
//
//  Created by Phil on 2022/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack {
                Text(viewModel.themeName).font(.largeTitle).foregroundColor(viewModel.themeColor)
                Spacer()
                Text("Score: \(viewModel.score)").font(.largeTitle).foregroundColor(.red)
            }
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card:card,viewModel: viewModel)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }.foregroundColor(.red)
            .padding(.horizontal)
            Button{viewModel.newGame()} label: {Text("NewGame")
                    .font(.largeTitle)
                .foregroundColor(Color.red)}
            
                
        }
    }
}

                         
struct CardView : View {
    let card:MemoryGame<String>.Card
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
        ContentView(viewModel: game)
            .previewDevice("iPhone 12 Pro")
            .preferredColorScheme(.dark)

    }
}
