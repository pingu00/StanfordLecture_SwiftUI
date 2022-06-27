//
//  ContentView.swift
//  Memorize
//
//  Created by Phil on 2022/06/24.
//

import SwiftUI

struct ContentView: View {

    let vehicleEmojis:[String] = ["🚗","🚕","🚙","🚌","🚎","🏎","🚛","🚆","🚑","🚒","🚐","🛻","🚚","🚜","🚔","🚖"]
    let animalEmojis:[String] = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐧"]
    let foodEmojis:[String] = ["🍏","🍎","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑"]
   @State var emojis:[String] = ["🚗","🚕","🚙","🚌","🚎","🏎","🚛","🚆","🚑","🚒","🚐","🛻","🚚","🚜","🚔","🚖"]
    
    let emojiCount = 16
    var title = " Memorize!"
    var body: some View {
        VStack{
            Text(title).font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount], id: \.self ){ emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
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
            Button(action: {emojis = vehicleEmojis.shuffled()}){ Image(systemName: "car")}.font(.largeTitle)
            Text("Vehicles")
        }
    }

    var animal : some View {
        VStack{
            Button(action: {emojis = animalEmojis.shuffled()}){Image(systemName: "pawprint")}.font(.largeTitle)
            Text("Animal")
        }
    }
    var food : some View {
        VStack{
            Button(action: {emojis = foodEmojis.shuffled()}){Image(systemName: "fork.knife")}.font(.largeTitle)
            Text("food")
        }
    }
}

                         
struct CardView : View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content)
                }
                else {
                    shape.fill()
                }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
            .preferredColorScheme(.dark)

    }
}
