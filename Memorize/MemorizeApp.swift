//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Phil on 2022/06/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
