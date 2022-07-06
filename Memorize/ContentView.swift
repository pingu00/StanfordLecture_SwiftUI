//
//  ContentView.swift
//  Memorize
//
//  Created by Phil on 2022/06/24.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel:EmojiMemoryGame
    

    var title = " Memorize!"
    var body: some View {
        VStack{
            Text(title).font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: cardNum)))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card:card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                Spacer()
                vehicles
                Spacer()
                animal
                Spacer()
                food
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var vehicles : some View {
        VStack{
            Button(action: {
                cardNum = Int.random(in: 4...16)
                let shuffledEmojis = vehicleEmojis.shuffled()
                defaultEmojis = Array(shuffledEmojis[0..<cardNum])})
            { Image(systemName: "car")}
                .font(.largeTitle)
            Text("Vehicles")
        }
    }

    var animal : some View {
        VStack{
            Button(action: {
                cardNum = Int.random(in: 1...16)
                let shuffledEmojis = animalEmojis.shuffled()
                defaultEmojis = Array(shuffledEmojis[0..<cardNum])})
                {Image(systemName: "pawprint")}
                .font(.largeTitle)
            Text("Animal")
        }
    }
    var food : some View {
        VStack{
            Button(action: {
                cardNum = Int.random(in: 4...16)
                let shuffledEmojis = foodEmojis.shuffled()
                defaultEmojis = Array(shuffledEmojis[0..<cardNum])}){Image(systemName: "fork.knife")}
                .font(.largeTitle)
            Text("Food")
        }
    }
}

func widthThatBestFits(cardCount: Int) -> CGFloat {
    let id = Int(ceil(CGFloat(cardCount).squareRoot())) - 1 // 카드개수의 루트값의 올림.
    if id == 0 {
        return 180
    }
    else if id == 1 {
        return 120
    }
    else if id == 2 {
        return 90
    }
    else if id == 3 {
        return 70
    }
    else {
        return 60
    }
}
                         
struct CardView : View {
    let card:MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                        .font(.title)
                }
                else {
                    shape.fill()
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
