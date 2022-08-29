//
//  Theme.swift
//  Memorize
//
//  Created by Phil on 2022/08/24.
//

import Foundation

struct Theme {
    var name :String
    var contents :Array<String>
    var numberOfPairsOfCard :Int
    var color :String
    
    init (name: String, contents: Array<String>, numberOfPairsOfCard:Int, color:String){
        self.name = name
        self.contents = contents
        self.numberOfPairsOfCard = numberOfPairsOfCard > contents.count ? contents.count : numberOfPairsOfCard
        self.color = color
    }
}
